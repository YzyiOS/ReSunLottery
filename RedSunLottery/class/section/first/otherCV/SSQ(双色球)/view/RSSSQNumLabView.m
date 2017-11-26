//
//  RSSSQNumLabView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSSQNumLabView.h"
#import "RSkCodeModel.h"

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
        RSkCodeModel *model = arrModel[i];
        UILabel *lab = [[UILabel alloc] init];
        lab.font = RSFont(15);
        lab.text = model.num;
        lab.textColor = model.numColor;
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
        if (i == 0) {
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.mas_left).offset(3);
                make.top.mas_equalTo(self.mas_top);
                make.bottom.mas_equalTo(self.mas_bottom);
                make.width.offset(18);
            }];
        }else{
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(labNal.mas_right).offset(4);
                make.top.mas_equalTo(labNal.mas_top);
                make.bottom.mas_equalTo(labNal.mas_bottom);
                make.width.offset(18);
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
