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
//比较与当前时间的大小  日期格式为2016-08-14 08：46：20
+ (BOOL)compareWithDate:(NSString*)endDate;
//把返回的开奖号换成数组，并添加颜色
+ (NSArray *)backKcodeModel:(NSString *)kcode;

+ (NSString *)backPeroidTitle:(NSString *)period;

@end
