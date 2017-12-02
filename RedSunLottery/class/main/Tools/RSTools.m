//
//  RSTools.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/14.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSTools.h"
#import <CommonCrypto/CommonCrypto.h>
#import "RSkCodeModel.h"

@interface RSTools()



@end

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
 *  @param aStr 需要转换的字符串
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
 *
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

//比较与当前时间的大小  日期格式为2016-08-14 08：46：20
+ (BOOL)compareWithDate:(NSString*)endDate
{
    NSInteger aa = 0;
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dta = [NSDate date];
    NSDate *dtb = [[NSDate alloc] init];
    NSString *DateTime = [dateformater stringFromDate:dta];
    dta = [dateformater dateFromString:DateTime];
    dtb = [dateformater dateFromString:endDate];
    NSComparisonResult result = [dta compare:dtb];
    if ((result=NSOrderedSame))
    {
        //        相等
        aa=1;
    }else if ((result=NSOrderedAscending))
    {
        //endDate比NowDate大
        aa=1;
    }else if ((result=NSOrderedDescending))
    {
        //endDate比NowDate小
        aa=0;
        
    }
    
    return aa;
}
//把返回的开奖号换成数组，并添加颜色
+ (NSArray *)backKcodeModel:(NSString *)kcode{
    NSArray *all = [kcode componentsSeparatedByString:@"|"];//根据|分割成两个数组
    NSArray *red = [all[0] componentsSeparatedByString:@","];//把红色数字拿出来
    NSMutableArray *backArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i =0 ; i < red.count; i ++) {
        RSkCodeModel *model = [[RSkCodeModel alloc] init];
        model.numColor = [UIColor colorWithHexString:@"#FF2C55"];
        model.num = red[i];
        [backArr addObject:model];
    }
    if (all.count > 1) {//可能没有篮球
        NSArray *blue = [all[1] componentsSeparatedByString:@","];
        for (int i = 0; i < blue.count; i ++) {
            RSkCodeModel *model = [[RSkCodeModel alloc] init];
            model.numColor = [UIColor colorWithHexString:@"#177FFC"];
            model.num = blue[i];
            [backArr addObject:model];
        }
    }
    
    
    return backArr;
}

+ (NSString *)backPeroidTitle:(NSString *)period{
    NSDictionary *dicPrioid = @{
                                 @"1700":@"竞彩足球",
                                 @"1710":@"竞彩篮球",
                                 @"1800":@"胜负彩",
                                 @"1810":@"任九",
                                 @"1820":@"四场进球彩",
                                 @"1830":@"六场半全场",
                                 @"1010":@"双色球",
                                 @"1030":@"福彩3D",
                                 @"1070":@"七乐彩",
                                 @"1500":@"大乐透",
                                 @"1510":@"七星彩",
                                 @"1520":@"排列5",
                                 @"1530":@"排列3",
                                 @"1050":@"吉林快3",
                                 @"1060":@"安徽快3",
                                 @"1090":@"江苏快3",
                                 @"1040":@"重庆时时彩",
                                 @"1200":@"江西时时彩",
                                 @"1550":@"广东11选5",
                                 @"1560":@"山东11选5",
                                 @"1570":@"上海11选5",
                                 
                                 };
    
    return dicPrioid[period];
    
}
@end
