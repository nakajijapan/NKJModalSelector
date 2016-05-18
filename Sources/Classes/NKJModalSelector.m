//
//  NKJModalSelector.m
//  Pods
//
//  Created by nakajijapan on 2016/05/19.
//
//

#import "NKJModalSelector.h"


static NKJModalSelector *_appearance = nil;

@implementation NKJModalSelector

+ (NKJModalSelector *)appearance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _appearance = [[self alloc] init];
        _appearance.shouldTransformScaleDown = YES;
    });
    
    return _appearance;
}

@end
