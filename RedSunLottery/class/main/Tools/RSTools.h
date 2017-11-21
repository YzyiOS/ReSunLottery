//
//  RSTools.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/14.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSTools : NSObject

/** 验证手机号 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/** 对字符串进行MD5加密 */
+ (NSString *)MD5:(NSString *)aStr;
/** 对NSDictionary转换并加密 */
+ (NSString *)dicToMD5:(NSDictionary *)dic;
/**
 获取Window 最上层 rootVC
 
 @return rootVC
 */

+ (UIViewController *)getTopVC;
@end
