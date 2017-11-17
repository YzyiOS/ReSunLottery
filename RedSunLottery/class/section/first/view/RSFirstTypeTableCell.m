//
//  RSFirstTypeTableCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/17.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstTypeTableCell.h"

@implementation RSFirstTypeTableCell

+ (instancetype)dequWith:(UITableView *)tableView
                 reuseId:(NSString *)reuseId
               indexPath:(NSIndexPath *)indexPath{
    
    RSFirstTypeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    if (!self) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
    
}
- (void)setVM:(RSFirstTypeCollectionVC *)viewModel {
    //    _viewModel = viewModel;
    for (UIView *view in self.contentView.subviews) {
        if (view == viewModel.view) {
            continue;
        }
        [view removeFromSuperview];
    }
    UIView *vcView = viewModel.view;
    //    if (!viewModel.viewModel.dataList.count) {
    //        [viewModel.viewModel.beChoosedSubject sendNext:nil];
    //    }
    [self.contentView addSubview:vcView];
    //    vcView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight+44);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
