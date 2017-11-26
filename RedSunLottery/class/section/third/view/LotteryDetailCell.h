//
//  LotteryDetailCell.h
//  RedSunLottery
//
//  Created by Marjoice on 17/11/2017.
//  Copyright © 2017 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LotteryType) {
    LotteryTypeDoubleChromospheric = 0,//双色球
    LotteryTypeFiveIn,//11选五
    LotteryTypeVictory,//胜负彩
    LotteryTypeFootBall,//竞彩足球
    LotteryTypeBasktBall//竞彩篮球
};
@interface LotteryDetailCell : UITableViewCell
@property (assign, nonatomic)  LotteryType          lotteryType;

@end
