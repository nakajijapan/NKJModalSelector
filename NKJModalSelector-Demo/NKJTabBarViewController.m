//
//  NKJTabBarViewController.m
//  NKJModalSelector-Demo
//
//  Created by nakajijapan on 2016/10/03.
//  Copyright © 2016年 nakajijapan. All rights reserved.
//

#import "NKJTabBarViewController.h"
#import "NKJModalSelector.h"

@implementation NKJTabBarViewController

- (IBAction)openButtonDidTap:(UIButton *)sender {
    
    [NKJModalSelector appearance].shouldTransformScaleDown = YES;
    NKJModalSelectorNavigationController *modalNavigationViewController = (NKJModalSelectorNavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"NKJModalSelectorNavigationController"];
    
    modalNavigationViewController.parentTabBarController = self.tabBarController;
    
    [self.tabBarController addChildViewController:modalNavigationViewController];
    [self.tabBarController si_presentViewControllerToViewController:modalNavigationViewController];
  
    
}

@end
