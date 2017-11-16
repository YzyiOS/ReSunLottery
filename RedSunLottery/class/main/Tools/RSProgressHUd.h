//
//  RSProgressHUd.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/13.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSProgressHUd : NSObject

+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)time;
+ (void)dismissWithCompletion:(void(^)())finish;
+ (void)dismissWithDelay:(NSTimeInterval)time finish:(void(^)())finish;
+ (void)showText:(NSString *)text;
+ (void)showSuccessWithText:(NSString *)text;
+ (void)showErrorWithText:(NSString *)text;
+ (void)showLoadingWithText:(NSString *)text;
+ (void)showImage:(UIImage *)image text:(NSString *)text;
+ (void)showProgressWithProgress:(CGFloat)progress;
+ (void)showProgressWithProgress:(CGFloat)progress text:(NSString *)text;

/** 在基类中判断 视图消失时候是否要影藏当前HUD */
// 判断是否要影藏 HUD
+ (BOOL)isVisible;

@end
