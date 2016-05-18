//
//  NKJModalSelectorAnimator.h
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//

#import <UIKit/UIKit.h>
#import "NKJModalSelector.h"

@interface NKJModalSelectorAnimator : NSObject

+ (void)presentToView:(UIView *)toView fromView:(UIView *)fromView completion:(void (^)(void))completion;
+ (UIView *)overlayViewFromView:(UIView *)view;
+ (UIView *)modalViewFromView:(UIView *)view;
+ (UIImageView *)screenShotViewFromOverLayView:(UIView *)view;
+ (void)dissmissFromView:(UIView *)fromView presentingViewController:(UIViewController *)presentingViewController completion:(void (^)(void))completion;
+ (void)transitionBackgroundViewFromOverlayView:(UIView *)overlayView location:(CGPoint)location;

@end
