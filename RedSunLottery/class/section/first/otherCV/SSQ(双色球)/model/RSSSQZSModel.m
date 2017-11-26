//
//  RSSSQZSModel.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/25.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSSQZSModel.h"

@implementation RSSSQZSModel

- (void)setEtime:(NSString *)etime{
    _etime = etime;
    //根据得到的结束时间，与现在的时间做对比，得到是否已经结束
    if ([RSTools compareWithDate:etime]) {
        self.statusTime = @"1";
    }else{
        self.statusTime = @"0";
    }
    
}

@end
