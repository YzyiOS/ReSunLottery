//
//  RSFooter_BasktBallModel.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFooter_BasktBallModel.h"

@implementation RSFooter_BasktBallModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"value":[RSFooter_BasBallValueModel class],
             };
}

@end
