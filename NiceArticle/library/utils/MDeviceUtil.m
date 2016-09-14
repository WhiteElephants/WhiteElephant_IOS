//
//  MDeviceUtil.m
//  NiceArticle
//
//  Created by krmao on 16/9/6.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "MDeviceUtil.h"

@implementation MDeviceUtil

+(CGRect) getScreenRect{
    CGRect bounds = [[UIScreen mainScreen] bounds]; // portrait bounds
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
        bounds.size = CGSizeMake(bounds.size.height, bounds.size.width);
    return bounds;
}

+(CGRect) getStatusBarRect{
    return [[UIApplication sharedApplication] statusBarFrame];
}
@end
