//
//  LotteryDetailCell.h
//  RedSunLottery
//
//  Created by Marjoice on 17/11/2017.
//  Copyright © 2017 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LotteryType) {
    LotteryTypeDoubleChromospheric = 0,
    LotteryTypeFiveIn,
    LotteryTypeVictory,
    LotteryTypeFootBall,
    LotteryTypeBasktBall
};
@interface LotteryDetailCell : UITableViewCell
@property (assign, nonatomic)  LotteryType          lotteryType;

@end
