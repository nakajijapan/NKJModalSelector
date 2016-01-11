//
//  UINavigationController+NKJModalSelector.h
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//

#import <UIKit/UIKit.h>
#import "NKJModalSelector.h"

@interface UINavigationController (NKJModalSelector)

- (UIView *)parentTagetView;
- (void)si_presentViewControllerToViewController:(UIViewController *)toViewController;
- (void)si_dismissModalViewWithComplation:(void (^)(void))completion;
- (void)overlayViewDidTap:(UITapGestureRecognizer *)gestureRecognizer;

@end
