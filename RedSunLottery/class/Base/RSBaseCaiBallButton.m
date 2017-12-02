//
//  RSBaseCaiBallButton.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/20.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBaseCaiBallButton.h"

@interface RSBaseCaiBallButton(){
    UIColor *_nalColor;
    UIColor *_selectColor;
    NSString *_strTitle;
}



@end

@implementation RSBaseCaiBallButton

- (instancetype)initWithFrame:(CGRect)frame nalColor:(UIColor *)nalColor selectColor:(UIColor *)selectColor titleStr:(NSString *)strTitle{
    self = [super initWithFrame:frame];
    if (self) {
        _nalColor = nalColor;
        _selectColor = selectColor;
        _strTitle = strTitle;
        [self setUI];
    }
    return self;
}
- (void)setUI{

    self.layer.cornerRadius = self.height / 2;
    self.layer.borderWidth = 1;
    self.layer.borderColor = _nalColor.CGColor;
    self.layer.masksToBounds = YES;
//    [self setBackgroundColor:[UIColor redColor]];
    [self setTitle:_strTitle forState:UIControlStateNormal];
    [self setTitleColor:_nalColor forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage imageWithColor:_nalColor] forState:UIControlStateSelected];
}
- (void)setSelectBtn:(BOOL)selectBtn{
    _selectBtn = selectBtn;
    self.selected = selectBtn;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
