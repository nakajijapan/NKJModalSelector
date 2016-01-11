//
//  UINavigationController+NKJModalSelector.m
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//

#import "UINavigationController+NKJModalSelector.h"

@implementation UINavigationController (NKJModalSelector)

- (UIView *)parentTagetView
{
    return self.view;
}

- (void)si_presentViewControllerToViewController:(UIViewController *)toViewController
{
    [toViewController beginAppearanceTransition:YES animated:YES];
    [NKJModalSelectorAnimator presentToView:toViewController.view
                                   fromView:[self parentTagetView]
                                 completion:^{
                                     
                                     [toViewController endAppearanceTransition];
                                     [toViewController didMoveToParentViewController:self];

                                 }];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(overlayViewDidTap:)];
    UIView *overlayView = [NKJModalSelectorAnimator overlayViewFromView:[self parentTagetView]];
    [overlayView addGestureRecognizer:tapGestureRecognizer];
}

- (void)si_dismissModalViewWithComplation:(void (^)(void))completion
{
    [self willMoveToParentViewController:nil];
    
    [NKJModalSelectorAnimator dissmissFromView:[self parentTagetView]
                      presentingViewController:self.visibleViewController
                                    completion:^{
                                        
                                        if (completion) {
                                            completion();
                                        }
                                    }];
}

- (void)overlayViewDidTap:(UITapGestureRecognizer *)gestureRecognizer
{

    [self willMoveToParentViewController:nil];
    
    [NKJModalSelectorAnimator dissmissFromView:[self parentTagetView]
                      presentingViewController:[self visibleViewController]
                                    completion:^{
                                        // none
                                    }];
}


@end
