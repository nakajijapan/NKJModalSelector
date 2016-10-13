//
//  UITabBarController+NKJModalSelector.m
//  Pods
//
//  Created by nakajijapan on 2016/10/04.
//
//

#import "UITabBarController+NKJModalSelector.h"

@implementation UITabBarController (NKJModalSelector)

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
    UIViewController *presentingViewController = self.childViewControllers.lastObject;
    [presentingViewController willMoveToParentViewController:nil];
    
    [NKJModalSelectorAnimator dissmissFromView:[self parentTagetView]
                      presentingViewController:presentingViewController
                                    completion:^{
                                        
                                        if (completion) {
                                            completion();
                                        }
                                        
                                        [presentingViewController removeFromParentViewController];

                                        
                                    }];
}

- (void)overlayViewDidTap:(UITapGestureRecognizer *)gestureRecognizer
{
    UIViewController *presentingViewController = self.childViewControllers.lastObject;
    [presentingViewController willMoveToParentViewController:nil];
    
    [NKJModalSelectorAnimator dissmissFromView:[self parentTagetView]
                      presentingViewController:presentingViewController
                                    completion:^{

                                        [presentingViewController removeFromParentViewController];

                                    }];
}

@end
