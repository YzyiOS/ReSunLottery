//
//  RSSFPViewCell.h
//  RedSunLottery
//
//  Created by haozhong on 2017/12/1.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSWinLoseColorModel.h"

@interface RSSFPViewCell : UITableViewCell

@property (nonatomic, copy)NSString *lid;

@property (nonatomic, strong)RSWinLoseColorModel  *model;

@end
