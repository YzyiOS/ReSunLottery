//
//  RSSSQSecvtionView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/22.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSSQSecvtionView.h"
#import "RSSSQNumLabView.h"

@interface RSSSQSecvtionView()

@property (nonatomic, strong) RSSSQNumLabView *labNumView;
@property (nonatomic, strong) UILabel *labTime;
@property (nonatomic, strong) UILabel *labJackpot;//奖池
@property (nonatomic, strong) UILabel *labBonus;
@property (nonatomic, strong) UILabel *labLottery;//上期开奖号码
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView  *lineView;

@end

@implementation RSSSQSecvtionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.labTime];
        [self addSubview:self.labNumView];
        [self addSubview:self.labLottery];
        [self addSubview:self.labBonus];
        [self addSubview:self.labJackpot];
        [self addSubview:self.lineView];
        [self addSubview:self.btn];
        [self setLayoutView];
    }
    return self;
}
- (UILabel *)labTime{
    if (!_labTime) {
        _labTime = [[UILabel alloc] init];
        _labTime.font = RSFont(14);
        _labTime.textColor = K_BlockTextColor;
        _labTime.text = @"第20171314期 11-1620:30截止";
    }
    return _labTime;
}
-(UILabel *)labJackpot{
    if (!_labJackpot) {
        _labJackpot = [[UILabel alloc] init];
        _labJackpot.font = RSFont(14);
        _labJackpot.textColor = K_77777BlockTextColor;
        _labJackpot.text = @"奖池";
    }
    return _labJackpot;
}
-(UILabel *)labBonus{
    if (!_labBonus) {
        _labBonus = [[UILabel alloc] init];
        _labBonus.font = RSFont(14);
        _labBonus.textColor = K_RedTextColor;
        _labBonus.text = @"9000亿";
    }
    return _labBonus;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = K_GRAY_BG_COLOR;
        _lineView.alpha = 0.5;
    }
    return _lineView;
}
- (UILabel *)labLottery{
    if (!_labLottery) {
        _labLottery = [[UILabel alloc] init];
        _labLottery.font = RSFont(14);
        _labLottery.textColor = K_77777BlockTextColor;
        _labLottery.text = @"上期开奖数";
    }
    
    return _labLottery;
}
- (RSSSQNumLabView *)labNumView{
    if (!_labNumView) {
        _labNumView = [[RSSSQNumLabView alloc] init];
    }
    return _labNumView;
}
-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setImage:RSImage(@"particulars_icon_unfurled") forState:UIControlStateNormal];
        [_btn setImage:RSImage(@"particulars_icon_pack") forState:UIControlStateSelected];
        [_btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
- (void)setZsModel:(RSSSQZSModel *)zsModel{
    _zsModel = zsModel;
    self.labTime.text = [NSString stringWithFormat:@"第%@ %@截止",zsModel.pname,zsModel.etime];
    self.labBonus.text = zsModel.gc;
}
- (void)setLsModel:(RSSSQLSModel *)lsModel{
    _lsModel = lsModel;
    if ([lsModel.kcode isEqualToString:@"等待开奖."]) {
        self.labNumView.arrModel = [RSTools backKcodeModel:@"00,00,00,00,00|00,00"];
    }else{
        
        self.labNumView.arrModel = [RSTools backKcodeModel:lsModel.kcode];
    }
 
    
}
- (void)setSelect:(BOOL)select{
    _select = select;
    self.btn.selected = select;
}
- (void)clickBtn:(UIButton *)selectBtn{
    self.btn.selected = !self.btn.selected;
    self.selectbtnType(self.btn.selected);
}
- (void)setLayoutView{
    [self.labTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.mas_top).offset(16);
    }];
    [self.labBonus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(self.mas_top).offset(16);
    }];
    [self.labJackpot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.labBonus.mas_left).offset(-5);
        make.top.mas_equalTo(self.labBonus.mas_top);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(45);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.offset(1);
    }];
    [self.labLottery mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.labTime.mas_left);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(16);
        make.width.offset(80);
    }];
    [self.labNumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.labLottery.mas_right).offset(5);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(16);
        make.width.offset(150);
        make.height.offset(20);
    }];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.labNumView.mas_centerY);
        make.width.height.mas_offset(20);
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
