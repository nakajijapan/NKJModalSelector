//
//  NKJModalSelectorNavigationController.m
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//

#import "NKJModalSelectorNavigationController.h"

@interface NKJModalSelectorNavigationController ()
@property (nonatomic) CGPoint previousLocation;
@property (nonatomic) CGPoint originalLocation;
@end

@implementation NKJModalSelectorNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.previousLocation = CGPointZero;
    self.originalLocation = CGPointZero;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    CGPoint location = [gestureRecognizer locationInView:self.parentViewController.view];
    UIView *backgroundView = [NKJModalSelectorAnimator overlayViewFromView:[self.parentNavigationController parentTagetView]];
    CGFloat degreeY = location.y - self.previousLocation.y;
    __block CGRect frame = self.view.frame;

    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:

            self.originalLocation = self.view.frame.origin;

            break;
        case UIGestureRecognizerStateChanged:


            frame.origin.y += degreeY;
            self.view.frame = frame;
            
            [NKJModalSelectorAnimator transitionBackgroundViewFromOverlayView:backgroundView
                                                                     location:location];

            break;
        case UIGestureRecognizerStateEnded:
            
            
            if (CGRectGetMinY(self.view.frame) < self.originalLocation.y) {



                gestureRecognizer.enabled = NO;
                [UIView animateWithDuration:0.2
                                 animations:^{
                                    
                                     CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

                                     frame.origin.y = statusBarHeight;
                                     frame.size.height -= statusBarHeight;
                                     self.view.frame = frame;
                                     
                                     [NKJModalSelectorAnimator transitionBackgroundViewFromOverlayView:backgroundView
                                                                                              location:self.view.frame.origin];

                                     
                                 } completion:^(BOOL finished) {
                                     
                                     [UIView animateWithDuration:0.1
                                                           delay:0.0
                                                         options:UIViewAnimationOptionCurveLinear
                                                      animations:^{
                                                          backgroundView.alpha = 0.f;
                                                      }
                                                      completion:^(BOOL finished) {
                                                         
                                                          if ([self.si_delegate respondsToSelector:@selector(navigationControllerDidSpreadToEntire:)]) {
                                                              [self.si_delegate navigationControllerDidSpreadToEntire:self];
                                                          }

                                                          
                                                      }];
                                 }];
                
                
            } else {
                
                [UIView animateWithDuration:0.6
                                      delay:0.0
                     usingSpringWithDamping:0.5f
                      initialSpringVelocity:0.1f
                                    options:UIViewAnimationOptionCurveLinear
                                 animations:^{

                                     [NKJModalSelectorAnimator transitionBackgroundViewFromOverlayView:backgroundView
                                                                                              location:self.originalLocation];
                                     frame.origin.y = self.originalLocation.y;
                                     self.view.frame = frame;
 
                                     
                                 }
                                 completion:nil
                 ];
                
                gestureRecognizer.enabled = YES;
                
            }
            
            break;

        default:
            break;
    }

    self.previousLocation = location;
    
}

@end
