//
//  RSFirstTypeTableCell.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/17.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSFirstTypeTableCell : UITableViewCell
+ (instancetype)deque:(UITableView *)tableView Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellHei:(CGFloat)cellHei;
@property (nonatomic, strong) NSArray *lotteryArr;

@end
