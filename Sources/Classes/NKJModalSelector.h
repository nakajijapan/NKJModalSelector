//
//  NKJModalSelector.h
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//


typedef enum :NSInteger {
    NKJModalSelectorInternalViewTypeToView = 900,
    NKJModalSelectorInternalViewTypeScreenShot = 910,
    NKJModalSelectorInternalViewTypeOverlay = 920
} NKJModalSelectorInternalViewType;

#import "NKJModalSelectorAnimator.h"
#import "NKJModalSelectorNavigationController.h"
#import "UINavigationController+NKJModalSelector.h"
#import "UITabBarController+NKJModalSelector.h"

@interface NKJModalSelector : NSObject
+ (instancetype)appearance;
@property (nonatomic) BOOL shouldTransformScaleDown;
@end
