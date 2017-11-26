//
//  RSCathexisManeger.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/20.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSCathexisManeger : NSObject

/**双色球
 constantNum 常数（根据完法来）
 red         红球个数
 blue        篮球个数
 @return 根据红篮球和常数，返回注数
 */

+ (long int)backNoteNumWithPlayConstant:(NSInteger)constantNum redNum:(NSInteger)red;

@end
