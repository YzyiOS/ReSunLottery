//
//  RSProgressHUd.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/13.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSProgressHUd.h"
#import <SVProgressHUD.h>

@implementation RSProgressHUd

+ (void)initialize{
    SVProgressHUD *apperance = [SVProgressHUD appearance];
    [apperance setDefaultStyle:SVProgressHUDStyleDark];
    [apperance setMaximumDismissTimeInterval:1];
    [apperance setFadeInAnimationDuration:0.2];
    [apperance setFadeOutAnimationDuration:0.2];
    [apperance setCornerRadius:6];
    [apperance setFont:[UIFont fontWithName:PINGFANG_SC_REGULAR size:15]];
    [apperance setMinimumSize:CGSizeMake(100, 40)];
}

#pragma mark - dismiss
+ (void)dismiss{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];//取消mask
    [SVProgressHUD dismiss];
}

+ (void)dismissWithDelay:(NSTimeInterval)time{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];//取消mask
    [SVProgressHUD dismissWithDelay:time];
}

+ (void)dismissWithCompletion:(void(^)())finish{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];//取消mask
    [SVProgressHUD dismissWithCompletion:finish];
}

+ (void)dismissWithDelay:(NSTimeInterval)time finish:(void(^)())finish{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];//取消mask
    [SVProgressHUD dismissWithDelay:time completion:finish];
}

#pragma mark - show
+ (void)showText:(NSString *)text{
    [SVProgressHUD showImage:nil status:text];
}

+ (void)showSuccessWithText:(NSString *)text{
    [SVProgressHUD showSuccessWithStatus:text];
}

+ (void)showErrorWithText:(NSString *)text{
    [SVProgressHUD showErrorWithStatus:text];
}

+ (void)showLoadingWithText:(NSString *)text{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];//设置mask
    [SVProgressHUD showWithStatus:text];
}

+ (void)showImage:(UIImage *)image text:(NSString *)text{
    [SVProgressHUD showImage:image status:text];
}

+ (void)showProgressWithProgress:(CGFloat)progress{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];//设置mask
    [SVProgressHUD showProgress:progress];
}

+ (void)showProgressWithProgress:(CGFloat)progress text:(NSString *)text{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];//设置mask
    [SVProgressHUD showProgress:progress status:text];
}

#pragma mark - status

+ (BOOL)isVisible{
    return  [SVProgressHUD isVisible];
}

@end
