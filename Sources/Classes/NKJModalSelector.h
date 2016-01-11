//
//  NKJModalSelector.h
//  NKJModalSelector
//
//  Created by nakajijapan on 2016/01/11.
//
//

#ifndef NKJModalSelector_h
#define NKJModalSelector_h

typedef enum :NSInteger {
    NKJModalSelectorInternalViewTypeToView = 900,
    NKJModalSelectorInternalViewTypeScreenShot = 910,
    NKJModalSelectorInternalViewTypeOverlay = 920
} NKJModalSelectorInternalViewType;

#import "NKJModalSelectorAnimator.h"
#import "NKJModalSelectorNavigationController.h"
#import "UINavigationController+NKJModalSelector.h"

#endif /* NKJModalSelector_h */
