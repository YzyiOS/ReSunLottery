//
//  RSFooter_BasktBall.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSFooter_BasBallValueModel.h"

@interface RSFooter_BasktBall : UITableViewCell

@property (nonatomic, assign) NSInteger type;//1700:竞彩足球 1710 竞彩篮球

@property (nonatomic, strong) RSFooter_BasBallValueModel *model;

@end
