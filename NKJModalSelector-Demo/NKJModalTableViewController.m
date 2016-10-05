//
//  NKJModalTableViewController.m
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//  Copyright © 2016年 nakajijapan. All rights reserved.
//

#import "NKJModalTableViewController.h"
#import "NKJModalSelector.h"

@interface NKJModalTableViewController () <NKJModalSelectorNavigationControllerDelegate>
@end

@implementation NKJModalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NKJModalSelectorNavigationController *navigationController = (NKJModalSelectorNavigationController *)self.navigationController;
    navigationController.si_delegate = self;
    self.tableView.scrollEnabled = NO;
    
}

#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Title #%zd", indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NKJModalSelectorNavigationController *currentController;
    currentController = (NKJModalSelectorNavigationController *)self.navigationController;

    if (currentController.parentNavigationController) {

        [currentController.parentNavigationController si_dismissModalViewWithComplation:^{
            NSLog(@"close via cell");
        }];

    } else {

        [currentController.parentTabBarController si_dismissModalViewWithComplation:^{
            NSLog(@"close via cell");
        }];
        
    }
    
}

#pragma mark - Button Actions

- (IBAction)closeButtonDidTap:(id)sender
{
    NKJModalSelectorNavigationController *currentController;
    currentController = (NKJModalSelectorNavigationController *)self.navigationController;
    
    if (currentController.parentNavigationController) {
        
        [currentController.parentNavigationController si_dismissModalViewWithComplation:^{
            NSLog(@"close via cell");
        }];
        
    } else {
        
        [currentController.parentTabBarController si_dismissModalViewWithComplation:^{
            NSLog(@"close via cell");
        }];
        
    }
}

#pragma mark - NKJModalSelectorNavigationControllerDelegate

- (void)navigationControllerDidSpreadToEntire:(UINavigationController *)navigationController
{
    self.tableView.scrollEnabled = YES;
    NSLog(@"spread to the entire");
}

@end
