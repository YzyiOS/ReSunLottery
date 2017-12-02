//
//  RSWinLoseOtherCellView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/29.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSWinLoseOtherCellView.h"

@interface RSWinLoseOtherCellView()

@property (nonatomic, assign)BOOL yesWid;//判断是用传进来的宽度还是用平分宽度

@end

@implementation RSWinLoseOtherCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = K_Blue_BG_COLOR;
        self.layer.cornerRadius = 4;
        _yesWid = YES;
        
    }
    return self;
}
- (void)setUI{
    if (self.arrWidth.count == 0 ||  !self.arrWidth) {
        _yesWid = NO;
    }else{
        _yesWid = YES;
    }
}
- (void)setTitleArr:(NSArray *)titleArr{
    _titleArr = titleArr;
    [self removeAllSubviews];
    [self setUI];
    CGFloat wid = (k_WIDTH  - 30) / titleArr.count;
    for (int i = 0; i < titleArr.count; i ++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(i * (_yesWid == NO ? wid : [self.arrWidth[i] floatValue]), 10, _yesWid == NO ? wid : [self.arrWidth[i] floatValue], 15)];
        lab.textColor = self.titleColor;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = RSFont(15);
        lab.text = titleArr[i];
        [self addSubview:lab];
    }
    for (int i = 0; i < self.arrContent.count; i ++) {
        NSArray *arr = self.arrContent[i];
        for (int j = 0; j < arr.count; j++) {
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(j *(_yesWid == NO ? wid : [self.arrWidth[j] floatValue]), 40 + (30 * i), _yesWid == NO ? wid : [self.arrWidth[j] floatValue], 15)];
            lab.textColor = self.nalColor;
            lab.textAlignment = NSTextAlignmentCenter;
            lab.font = RSFont(15);
            lab.text = [NSString stringWithFormat:@"%@",arr[j]];
            [self addSubview:lab];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
