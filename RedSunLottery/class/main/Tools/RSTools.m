//
//  RSTools.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/14.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSTools.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation RSTools

/** 验证手机号 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum{
    if (mobileNum.length == 11) {
        return YES;
    }else{
        return NO;
    }
    
}
/**
 *  对字符串进行MD5加密
 *
 *  @param str 需要转换的字符串
 *
 *  @return 转化的字符串
 *
 *  @since 1.0
 */
+ (NSString *)MD5:(NSString *)aStr
{
    if (aStr == nil || aStr.length == 0) {
        return nil;
    }
    const char *value = [aStr UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [outputString appendFormat:@"%02x",outputBuffer[i]];
    }
    return outputString;
}
/**
 *  对字符串进行MD5加密
 *
 *  @param  需要转换的字符串
 *
 *  @return 转化的字符串
 *
 *  @since 1.0
 */
+ (NSString *)dicToMD5:(NSDictionary *)dic{
    NSDictionary *dicStr = dic.copy;
    NSArray *keyAll = [dicStr allKeys];
    NSArray *dataAll = [dicStr allValues];
    RSLog(@"%@",keyAll);
    RSLog(@"%@",dataAll);
    NSString *strParamer = @"";
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(compare:)];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    for (id nestedKey in [dic.allKeys sortedArrayUsingDescriptors:@[ sortDescriptor ]]) {
        NSLog(@"%@",nestedKey);
        [arr addObject:nestedKey];
    }
    for (NSInteger i = arr.count - 1; i >= 0; i --) {
        strParamer = [strParamer stringByAppendingFormat:@"%@=%@&",arr[i],dic[arr[i]]];
        
    }
    strParamer = [strParamer stringByAppendingString:@"skey=BB432ANDROID998"];
    
    NSLog(@"%@",strParamer);
    return [self MD5:strParamer];
}
/**
 获取Window 最上层 rootVC
 
 @return rootVC
 */

+ (UIViewController *)getTopVC{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self topViewControllerWithRootViewController:rootViewController];
}
/**
 获取传入的控制器上的rootVC
 
 @param rootViewController 传入的rootVC
 @return rootVC
 */
+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
        
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
        
    } else if (rootViewController.presentedViewController) {
        
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        
        return [self topViewControllerWithRootViewController:presentedViewController];
        
    } else {
        return rootViewController;
    }
}
@end
