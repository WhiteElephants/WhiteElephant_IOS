//
//  MToastUtil.h
//  MToastUtil
//
//  Small popup message inspired by Android Toast object
//
//  Created by Nik Dyonin on 08.04.11.
//  Copyright (c) 2011 Nik Dyonin. All rights reserved.
//  Copyright (c) 2014 Brite Apps. All rights reserved.
//

@import Foundation;
@import UIKit;
@import QuartzCore;

#define RGB(a, b, c) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:1.0f]
#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]

typedef NS_ENUM(NSInteger, MToastUtilDuration) {
    kWTShort = 1,
    kWTLong = 5
};

typedef NS_ENUM(NSInteger, MToastUtilGravity) {
    kWTGravityBottom = 0,
    kWTGravityMiddle = 1,
    kWTGravityTop = 2
};

@interface MToastUtil : UIView

+ (void)showWithText:(NSString *)text;
+ (void)showWithImage:(UIImage *)image;

+ (void)showWithText:(NSString *)text duration:(NSInteger)duration;
+ (void)showWithImage:(UIImage *)image duration:(NSInteger)duration;

+ (void)showWithText:(NSString *)text duration:(NSInteger)duration roundedCorners:(BOOL)roundedCorners;
+ (void)showWithImage:(UIImage *)image duration:(NSInteger)duration roundedCorners:(BOOL)roundedCorners;

+ (void)showWithText:(NSString *)text gravity:(MToastUtilGravity)gravity;
+ (void)showWithImage:(UIImage *)image gravity:(MToastUtilGravity)gravity;

+ (void)showWithText:(NSString *)text duration:(NSInteger)duration gravity:(MToastUtilGravity)gravity;
+ (void)showWithImage:(UIImage *)image duration:(NSInteger)duration gravity:(MToastUtilGravity)gravity;

+ (void)showWithText:(NSString *)text duration:(NSInteger)duration roundedCorners:(BOOL)roundedCorners gravity:(MToastUtilGravity)gravity;
+ (void)showWithImage:(UIImage *)image duration:(NSInteger)duration roundedCorners:(BOOL)roundedCorners gravity:(MToastUtilGravity)gravity;

@end