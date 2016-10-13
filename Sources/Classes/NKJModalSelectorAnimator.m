//
//  NKJModalSelectorAnimator.m
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//

#import "NKJModalSelectorAnimator.h"

@implementation NKJModalSelectorAnimator

+ (void)presentToView:(UIView *)toView fromView:(UIView *)fromView completion:(void (^)(void))completion
{
    UIView *overlayView = [[UIView alloc] initWithFrame:fromView.bounds];
    
    overlayView.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:1.f];
    overlayView.userInteractionEnabled = YES;
    overlayView.tag = NKJModalSelectorInternalViewTypeOverlay;
    [fromView addSubview:overlayView];
    
    [self addScreenShotViewWithCapturedView:fromView screenshotContainer:overlayView];
    
    toView.frame = CGRectOffset(fromView.bounds, 0.f, fromView.bounds.size.height);
    toView.tag = NKJModalSelectorInternalViewTypeToView;
    [fromView addSubview:toView];

    [UIView animateWithDuration:0.25
                     animations:^{

                         CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
                         toView.frame = CGRectOffset(fromView.bounds, 0.f, statusBarHeight + fromView.bounds.size.height / 2.0);
                         toView.alpha = 1.f;

                     }
                     completion:^(BOOL finished) {
                         
                         if (completion) {
                             completion();
                         }
                         
                     }];
    
}

+ (UIView *)overlayViewFromView:(UIView *)view
{
    return [view viewWithTag:NKJModalSelectorInternalViewTypeOverlay];
}

+ (UIView *)modalViewFromView:(UIView *)view
{
    return [view viewWithTag:NKJModalSelectorInternalViewTypeToView];
}

+ (UIImageView *)screenShotViewFromOverLayView:(UIView *)view
{
    return (UIImageView *)[view viewWithTag:NKJModalSelectorInternalViewTypeScreenShot];
}


+ (void)dissmissFromView:(UIView *)fromView presentingViewController:(UIViewController *)presentingViewController completion:(void (^)(void))completion
{
    UIView *targetView = fromView;
    UIView *modalView = [NKJModalSelectorAnimator modalViewFromView:fromView];
    UIView *overlayView = [NKJModalSelectorAnimator overlayViewFromView:fromView];
    overlayView.alpha = 1.f;

    [UIView animateWithDuration:0.2
                     animations:^{
                         
                         
                         modalView.frame = CGRectMake(
                                                      (targetView.bounds.size.width - modalView.frame.size.width) / 2.f,
                                                      targetView.bounds.size.height,
                                                      modalView.frame.size.width,
                                                      modalView.frame.size.height);
                         
                     }
                     completion:^(BOOL finished) {

                         [overlayView removeFromSuperview];
                         [modalView removeFromSuperview];
                         
                     }];
    
    if (overlayView != nil) {
        
        UIImageView *screenShotView = (UIImageView *)overlayView.subviews[0];
        [screenShotView.layer addAnimation:[self animationGroupWithForward:NO] forKey:@"bringForwardAnimation"];
        
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             screenShotView.alpha = 1.f;
                             
                         } completion:^(BOOL finished) {
                             
                             if (completion) {
                                 completion();
                             }

                         }];
    }
}

+ (void)transitionBackgroundViewFromOverlayView:(UIView *)overlayView location:(CGPoint)location;
{
    if (![NKJModalSelector appearance].shouldTransformScaleDown) {
        return;
    }

    UIImageView *screenShotView = [NKJModalSelectorAnimator screenShotViewFromOverLayView:overlayView];
    CGFloat scale = [self mapWithValue:location.y
                                 inMin:0.f
                                 inMax:[UIScreen mainScreen].bounds.size.height
                                outMin:0.9f
                                outMax:1.f];

    CATransform3D transform = CATransform3DMakeScale(scale, scale, 1.f);
    [screenShotView.layer removeAllAnimations];
    screenShotView.layer.transform = transform;
    [screenShotView setNeedsLayout];
    [screenShotView layoutIfNeeded];

}

#pragma mark - Private

+ (void)addScreenShotViewWithCapturedView:(UIView *)capturedView screenshotContainer:(UIView *)screenshotContainer
{
    screenshotContainer.hidden = YES;
    
    UIGraphicsBeginImageContextWithOptions(capturedView.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, -capturedView.bounds.origin.x, -capturedView.bounds.origin.y);
    
    [capturedView.layer renderInContext:context];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    screenshotContainer.hidden = NO;
    
    UIImageView *screenshot = [[UIImageView alloc] initWithImage:image];
    screenshot.tag = NKJModalSelectorInternalViewTypeScreenShot;
    screenshot.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [screenshotContainer addSubview:screenshot];
    
    [screenshot.layer addAnimation:[self animationGroupWithForward:YES] forKey:@"pushedBackAnimation"];
    [UIView animateWithDuration:0.2
                     animations:^{
                         screenshot.alpha = 0.5f;
                     }];
}

+ (CAAnimationGroup *)animationGroupWithForward:(BOOL)forward
{
    CATransform3D transform = CATransform3DIdentity;
    
    if ([NKJModalSelector appearance].shouldTransformScaleDown) {
        transform = CATransform3DScale(transform, 0.95f, 0.95f, 1.f);
    } else {
        transform = CATransform3DScale(transform, 1.f, 1.f, 1.f);
    }

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    if (forward) {
        animation.toValue = [NSValue valueWithCATransform3D:transform];
    } else {
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    }
    
    animation.duration = 0.2;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.duration = animation.duration;
    group.animations = @[animation];
    return group;
}

+ (CGFloat)mapWithValue:(CGFloat)value inMin:(CGFloat)inMin inMax:(CGFloat)inMax outMin:(CGFloat)outMin outMax:(CGFloat)outMax
{
    CGFloat inRatio = value / (inMax - inMin);
    CGFloat outRatio = (outMax - outMin) * inRatio + outMin;
    
    return outRatio;
}

@end
