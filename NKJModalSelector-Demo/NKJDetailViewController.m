//
//  NKJDetailViewController.m
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//  Copyright © 2016年 nakajijapan. All rights reserved.
//

#import "NKJDetailViewController.h"
#import "NKJModalSelector.h"

@interface NKJDetailViewController ()

@end

@implementation NKJDetailViewController

- (IBAction)buttonDidTap:(id)sender {
    
    NKJModalSelectorNavigationController *modalNavigationViewController = (NKJModalSelectorNavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"NKJModalSelectorNavigationController"];
    
    modalNavigationViewController.parentNavigationController = self.navigationController;
    
    [self.navigationController addChildViewController:modalNavigationViewController];
    [self.navigationController si_presentViewControllerToViewController:modalNavigationViewController];
    
    
}


@end
