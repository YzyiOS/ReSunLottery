//
//  RSWinLoseNumCellView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/29.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSWinLoseNumCellView.h"
@interface RSWinLoseNumCellView()



@end

@implementation RSWinLoseNumCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = K_Blue_BG_COLOR;
        self.layer.cornerRadius = 4;
        [self setUI];
    }
    return self;
}

- (void)setModel:(RSWinLoseColorModel *)model{
    _model = model;
    [self removeAllSubviews];
    CGFloat wid = (k_WIDTH - 30) / 14;
    NSArray *arrTitle = [model.matches componentsSeparatedByString:@","];
    for (int i = 0; i < arrTitle.count; i ++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(i * wid + 5, 0, 15, 60)];
        lab.numberOfLines = 0;
        lab.textColor = K_BlockTextColor;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = RSFont(12);
        lab.text = arrTitle[i];
        [self addSubview:lab];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, k_WIDTH - 30, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineView];
    NSArray *arrNum = [model.kcode componentsSeparatedByString:@","];
    for (int i = 0; i < arrNum.count; i ++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(i * wid + 5, 65, 15, 30)];
        lab.numberOfLines = 0;
        lab.textColor = K_RedTextColor;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = RSFont(12);
        lab.text = arrNum[i];
        [self addSubview:lab];
    }
    
    for (int i = 1; i < 14; i ++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(i * wid, 0, 1, 100)];
        line.backgroundColor = [UIColor whiteColor];
        [self addSubview:line];
    }
    
}
- (void)setUI{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
