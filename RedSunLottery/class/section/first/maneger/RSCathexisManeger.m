//
//  RSCathexisManeger.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/20.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSCathexisManeger.h"

#define DoubleballM_Num     6  //双色球的m值



@interface RSCathexisManeger()



@end

@implementation RSCathexisManeger

/**双色球
 constantNum 常数（根据完法来）
 red         红球个数
 blue        篮球个数
 @return 根据红篮球和常数，返回注数
 */

+ (long int)backNoteNumWithPlayConstant:(NSInteger)constantNum redNum:(NSInteger)red{
    if (red <= 0 || constantNum <= 0 || red < constantNum) {
        return 0;
    }
    if ( constantNum !=0 && constantNum == red) {
        return 1;
    }
    long int result = 1;
    for (NSInteger i = red; i >= red - constantNum + 1; i --) {
        result *= i;
    }
    for (NSInteger i = constantNum; i >= 2; i --) {
        result /= i;
    }
    
    return result;
}


@end
