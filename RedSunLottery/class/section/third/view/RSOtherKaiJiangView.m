//
//  RSOtherKaiJiangView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/12/1.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSOtherKaiJiangView.h"

#import "RSBaseCaiBallButton.h"

@interface RSOtherKaiJiangView()

@property (nonatomic, strong) UILabel *labQiCi;

@property (nonatomic, strong) UILabel *labTime;

@end

@implementation RSOtherKaiJiangView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.labQiCi];
        [self addSubview:self.labTime];
        [self setLayoutMasUI];
        
    }
    return self;
}
- (UILabel *)labQiCi{
    if (!_labQiCi) {
        _labQiCi = [[UILabel alloc] init];
        _labQiCi.font = RSFont(17);
        _labQiCi.textColor = K_BlockTextColor;
        _labQiCi.text = @"2017105期";
    }
    return _labQiCi;
}
- (UILabel *)labTime {
    if (!_labTime) {
        _labTime = [[UILabel alloc] init];
        _labTime.textColor = K_77777BlockTextColor;
        _labTime.font = RSFont(17);
        _labTime.text = @"2017-11-02 周四";
    }
    return _labTime;
}
- (void)setModel:(RSWinLoseColorModel *)model{
    _model = model;
    self.labQiCi.text = [NSString stringWithFormat:@"%@期",model.pid];
    self.labTime.text = model.ktime;
    NSArray *arr = [RSTools backKcodeModel:model.kcode];
    for (NSInteger i = arr.count - 1; i >= 0; i --) {
        RSkCodeModel *model = [arr objectAtIndex:i];
        RSBaseCaiBallButton *btn = [[RSBaseCaiBallButton alloc] initWithFrame:CGRectMake(k_WIDTH - (34 + 5) * (arr.count - i) - 15, 70, 34, 34) nalColor:model.numColor selectColor:model.numColor titleStr:model.num];
        btn.selected = YES;
        [self addSubview:btn];
    }
    
    
}
- (void)setLayoutMasUI{
    [self.labQiCi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.mas_top).offset(20);
    }];
    
    [self.labTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(self.labQiCi.mas_top);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
