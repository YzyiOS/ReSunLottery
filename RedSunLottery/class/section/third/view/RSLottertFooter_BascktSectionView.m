//
//  RSLottertFooter_BascktSectionView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSLottertFooter_BascktSectionView.h"

@interface RSLottertFooter_BascktSectionView()

@property (nonatomic, strong) UILabel *labTime;

@property (nonatomic, strong) UIButton *btn;

@end

@implementation RSLottertFooter_BascktSectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = K_GRAY_BG_COLOR;
        [self addSubview:self.labTime];
        [self addSubview:self.btn];
        [self setLayoutUI];
    }
    return self;
    
}
- (UILabel *)labTime{
    if (!_labTime) {
        _labTime = [[UILabel alloc] init];
        _labTime.font = RSFont(15);
        _labTime.textColor = K_BlockTextColor;
        _labTime.text = @"2016-11-25 周四";
    }
    return _labTime;
    
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setImage:RSImage(@"particulars_icon_unfurled") forState:UIControlStateNormal];
        [_btn setImage:RSImage(@"particulars_icon_pack") forState:UIControlStateSelected];
        
        [_btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
    
}


- (void)setTitle:(NSString *)title{
    _title = title;
    self.labTime.text = title;
    self.btn.selected = self.selectEnd;
    
}
- (void)clickBtn:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.selectBtn) {
        self.selectBtn(@{[NSString stringWithFormat:@"%ld",self.sectionNum]:@(sender.selected)});
    }
    
}
- (void)returnSelectEnd:(SelectedBtnBlock)block{
    self.selectBtn = block;
}

- (void)setLayoutUI{
    [self.labTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.mas_centerY)
        ;
        make.width.height.offset(17);
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
