//
//  RSSSQNumLabView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSSQNumLabView.h"

@implementation RSSSQNumLabView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)setArrModel:(NSArray *)arrModel{
    _arrModel = arrModel;
    UILabel *labNal = nil;
    
    for (int i = 0; i < arrModel.count; i ++) {
        UILabel *lab = [[UILabel alloc] init];
        lab.font = RSFont(15);
        lab.text = @"11";
        lab.textColor = Color_double_red;
        [self addSubview:lab];
        if (i == 0) {
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.mas_left).offset(0);
                make.top.mas_equalTo(self.mas_top);
                make.bottom.mas_equalTo(self.mas_bottom);

            }];
        }else{
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(labNal.mas_right).offset(5);
                make.top.mas_equalTo(labNal.mas_top);
                make.bottom.mas_equalTo(labNal.mas_bottom);

            }];
        }
        labNal = lab;
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
