//
//  UITabBarController+NKJModalSelector.h
//  Pods
//
//  Created by nakajijapan on 2016/10/04.
//
//

#import <UIKit/UIKit.h>
#import "NKJModalSelector.h"

@interface UITabBarController (NKJModalSelector)

- (UIView *)parentTagetView;
- (void)si_presentViewControllerToViewController:(UIViewController *)toViewController;
- (void)si_dismissModalViewWithComplation:(void (^)(void))completion;
- (void)overlayViewDidTap:(UITapGestureRecognizer *)gestureRecognizer;

@end
