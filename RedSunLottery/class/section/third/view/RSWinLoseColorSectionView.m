//
//  RSWinLoseColorSectionView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/29.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSWinLoseColorSectionView.h"

#import "RSBaseCaiBallButton.h"

@interface RSWinLoseColorSectionView()

@property (nonatomic, strong) UILabel *labQiCi;//期次

@property (nonatomic, strong) UILabel *labTime;

@property (nonatomic, strong) UIButton *btnUpDown;

@property (nonatomic, strong) UIView *viewLabArr;//用来装数字lab

@end


@implementation RSWinLoseColorSectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.labQiCi];
        [self addSubview:self.labTime];
        [self addSubview:self.viewLabArr];
        [self addSubview:self.btnUpDown];
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
- (UIView *)viewLabArr{
    if (!_viewLabArr) {
        _viewLabArr = [[UIView alloc] init];
//        _viewLabArr.backgroundColor = [UIColor redColor];
    }
    return _viewLabArr;
}
- (UIButton *)btnUpDown{
    if (!_btnUpDown) {
        _btnUpDown = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnUpDown setImage:RSNalBtn_DownImg forState:UIControlStateNormal];
        [_btnUpDown setImage:RSNalBtn_UpImg forState:UIControlStateSelected];
        [_btnUpDown addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnUpDown;
    
}
- (void)setModel:(RSWinLoseColorModel *)model{
    _model = model;
    self.btnUpDown.selected = self.selectEnd;
    self.labQiCi.text = [NSString stringWithFormat:@"%@期",model.pid];
    self.labTime.text = model.ktime;
    
    if ([model.lid integerValue] == 1800 || [model.lid integerValue] == 1810) {
        NSArray *arr = [model.kcode componentsSeparatedByString:@","];
        for (int i = 0; i  < arr.count; i ++) {
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(i *(20 + 3) , 0, 20 , 27)];
            lab.layer.cornerRadius = 4;
            lab.layer.masksToBounds = YES;
            lab.backgroundColor = Color_double_red;
            lab.textAlignment = NSTextAlignmentCenter;
            lab.textColor = [UIColor whiteColor];
            lab.text = arr[i];
            [self.viewLabArr addSubview:lab];
            
        }
    }else{
        NSArray *arr = [RSTools backKcodeModel:model.kcode];
        for (NSInteger i = arr.count - 1; i >= 0; i --) {
            RSkCodeModel *model = [arr objectAtIndex:i];
            RSBaseCaiBallButton *btn = [[RSBaseCaiBallButton alloc] initWithFrame:CGRectMake(k_WIDTH - (34 + 5) * (arr.count - i) - 50, 0, 34, 34) nalColor:model.numColor selectColor:model.numColor titleStr:model.num];
            btn.selected = YES;
            [self.viewLabArr addSubview:btn];
        }
    }
    
    
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

- (void)setLayoutMasUI{
    [self.labQiCi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.mas_top).offset(20);
    }];
    
    [self.labTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(self.labQiCi.mas_top);
    }];
    
    [self.btnUpDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(self.labTime.mas_bottom).offset(40);
        make.height.width.mas_offset(17);
    }];
    [self.viewLabArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.btnUpDown.mas_left).offset(-10);
        make.centerY.mas_equalTo(self.btnUpDown.mas_centerY);
        make.height.mas_offset(30);
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
