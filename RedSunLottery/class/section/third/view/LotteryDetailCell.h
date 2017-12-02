//
//  LotteryDetailCell.h
//  RedSunLottery
//
//  Created by Marjoice on 17/11/2017.
//  Copyright © 2017 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "periodTitleModel.h"

typedef NS_ENUM(NSUInteger, LotteryType) {
    LotteryTypeDoubleChromospheric = 1010,//双色球
    LotteryTypeGDFiveIn = 1550,//广东11选五
    LotteryTypeSDFiveIn = 1560,//山东11选五
    LotteryTypeSHFiveIn = 1570,//上海11选五
    LotteryTypeVictory = 1800,//胜负彩
    LotteryTypeFootBall = 1700,//竞彩足球
    LotteryTypeBasktBall = 1710,//竞彩篮球
    LotterTypeBask3D     =1030,//3D福彩
    LotteryTypePaiLie3   =1530,//排列三
    LotterTypeCQQSSCai   =1040,//重庆时时彩
    LotteryTypeAnHuiKuai3 = 1060,//安徽快3
    LotteryTypeJiLingKuai3 = 1050,//吉林快3
    LotteryTypeJiangSuKusai3 = 1090,//江苏快3
    
};
@interface LotteryDetailCell : UITableViewCell
@property (assign, nonatomic)  LotteryType          lotteryType;
@property (nonatomic, strong) periodTitleModel *model;

@end
