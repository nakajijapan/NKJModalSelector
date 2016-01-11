//
//  NKJModalSelectorNavigationController.h
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//

#import <UIKit/UIKit.h>
#import "NKJModalSelector.h"

@protocol NKJModalSelectorNavigationControllerDelegate <NSObject>
- (void)navigationControllerDidSpreadToEntire:(UINavigationController *)navigationController;
@end

@interface NKJModalSelectorNavigationController : UINavigationController
@property (nonatomic) id<NKJModalSelectorNavigationControllerDelegate> si_delegate;
@property (nonatomic) UINavigationController *parentNavigationController;
@end
