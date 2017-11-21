//
//  LotteryDetailCell.m
//  RedSunLottery
//
//  Created by Marjoice on 17/11/2017.
//  Copyright © 2017 RedSun. All rights reserved.
//

#import "LotteryDetailCell.h"

#define MARGIN                                     5

#define DOUBLEBALL_BTN_HEIGHT                      17       // 双色球 + 11选5 等宽高
#define VICTORY_BTN_HEIGHT                         13.5
#define VICTORY_BTN_WIDTH                          10
#define BALL_BTN_WIDTH                             149
#define BALL_BTN_HEIGHT                            17.5

@interface LotteryDetailCell ()
@property (strong, nonatomic)  UIButton                     *btnNums;
@property (strong, nonatomic)  NSMutableArray               *arrDoubleBall;

@end

@implementation LotteryDetailCell {
    
    int   _count;
}

//调用前先为 _count 赋值
- (void)buildElements {
    
    _count = 7;
    self.btnNums = [UIButton buttonWithType:UIButtonTypeCustom];
    self.arrDoubleBall = [NSMutableArray arrayWithCapacity:_count];
    if (self.lotteryType == LotteryTypeDoubleChromospheric) {
        for (int i = 0; i < _count; i++) {
            
            self.btnNums.frame = CGRectMake(0, 0, k_WIDTH - 15 - (DOUBLEBALL_BTN_HEIGHT+MARGIN)*i, DOUBLEBALL_BTN_HEIGHT);
            self.btnNums.layer.cornerRadius = DOUBLEBALL_BTN_HEIGHT * 0.5;
            self.btnNums.titleLabel.text = self.arrDoubleBall[i];
            i == 0 ? self.btnNums.backgroundColor = Color_double_blue : Color_double_red;
            [self.contentView addSubview:self.btnNums];
        }
        
    }else if (self.lotteryType == LotteryTypeFiveIn) {
        
        
    }else if (self.lotteryType == LotteryTypeVictory) {
        
        
    }else{
        
        
    }
}


@end
