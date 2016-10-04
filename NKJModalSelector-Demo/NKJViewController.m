//
//  NKJViewController.m
//  NKJModalSelector
//
//  Created by nakajijapan on 01/10/2016.
//  Copyright (c) 2016 nakajijapan. All rights reserved.
//

#import "NKJViewController.h"

@interface NKJViewController ()

@end


@implementation NKJViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:NO];
}

@end
