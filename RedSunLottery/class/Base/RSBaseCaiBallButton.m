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
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(self.width, self.height)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    maskLayer.borderWidth = 1;
    maskLayer.borderColor = _nalColor.CGColor;
    self.layer.mask = maskLayer;
    [self setTitleColor:_selectColor forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
