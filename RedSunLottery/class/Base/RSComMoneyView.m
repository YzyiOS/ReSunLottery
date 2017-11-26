//
//  RSComMoneyView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/24.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSComMoneyView.h"

@interface RSComMoneyView()

@property (nonatomic, strong) UIButton *btnDelet;

@property (nonatomic, strong) UIButton *btnSure;

@property (nonatomic, strong) UILabel *labMoney;
@property (nonatomic, strong) UILabel *labZhuShu;
@property (nonatomic, strong) UILabel *labGong;
@property (nonatomic, strong) UILabel *labZhu;
@property (nonatomic, strong) UILabel *labYuan;


@end

@implementation RSComMoneyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
    
}

- (void)setUI{
    _btnDelet = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnDelet.backgroundColor = K_RedTextColor;
    [self addSubview:_btnDelet];
    [_btnDelet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.height.mas_offset(25);
    }];
    _btnSure = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSure.layer.cornerRadius = 17;
    _btnSure.titleLabel.font = RSFont(14);
    [_btnSure setTitle:@"确认" forState:UIControlStateNormal];
    [_btnSure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnSure setBackgroundColor:K_RedTextColor];
    [_btnSure addTarget:self action:@selector(clickSure:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_btnSure];
    [_btnSure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.height.offset(34);
        make.centerY.mas_equalTo(self.mas_centerY);
        
        make.width.offset(90);
    }];
    
    _labYuan = [[UILabel alloc] init];
    _labYuan.text = @"元";
    _labYuan.font = RSFont(15);
    _labYuan.textColor = K_BlockTextColor;
    [self addSubview:_labYuan];
    [_labYuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_btnSure.mas_left).offset(-40);
        make.centerY.mas_equalTo(self.mas_centerY);
        
    }];
    
    _labMoney = [[UILabel alloc] init];
    _labMoney.text = @"0";
    _labMoney.font = RSFont(15);
    _labMoney.textColor = K_RedTextColor;
    [self addSubview:_labMoney];
    [_labMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_labYuan.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    _labZhu = [[UILabel alloc] init];
    _labZhu.text = @"注";
    _labZhu.font = RSFont(15);
    _labZhu.textColor = K_BlockTextColor;
    [self addSubview:_labZhu];
    [_labZhu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_labMoney.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.mas_centerY);
        
    }];
    
    
    _labZhuShu = [[UILabel alloc] init];
    _labZhuShu.text = @"0";
    _labZhuShu.font = RSFont(15);
    _labZhuShu.textColor = K_RedTextColor;
    [self addSubview:_labZhuShu];
    [_labZhuShu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_labZhu.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    _labGong = [[UILabel alloc] init];
    _labGong.text = @"共";
    _labGong.font = RSFont(15);
    _labGong.textColor = K_BlockTextColor;
    [self addSubview:_labGong];
    [_labGong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_labZhuShu.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.mas_centerY);
        
    }];
    
}
- (void)setStrMoney:(NSString *)strMoney{
    _strMoney = strMoney;
    _labMoney.text = strMoney;
}
- (void)setStrZhuShu:(NSString *)strZhuShu{
    _strZhuShu = strZhuShu;
    _labZhuShu.text = strZhuShu;
}

- (void)clickSure:(UIButton *)btn{
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
