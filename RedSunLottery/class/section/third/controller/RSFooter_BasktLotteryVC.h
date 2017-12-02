//
//  RSFooter_BasktLotteryVC.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBaseViewController.h"

typedef NS_OPTIONS(NSUInteger, PlayType) {
    PlayTypeFooterball    = 1700, // 足球
    PlayTypeBasktball  = 1710, // 篮球
};


@interface RSFooter_BasktLotteryVC : RSBaseViewController

@property (nonatomic, copy) NSString *titleStr;

@property (nonatomic, assign) PlayType play;

@end
