//
//  RSTabBar.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSTabBar.h"

@implementation RSTabBar

- (void)layoutSubviews{
    [super layoutSubviews];
    [self _replaceTabBarTopLine];
}

/** 移除底部的线条 */
- (void)_replaceTabBarTopLine{
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#CFCFCF"];
    lineView.alpha = 0.7;
    if (IOS10_OR_LATER) {
        // 移除线条
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                lineView.frame = CGRectMake(0, 0, k_WIDTH, 0.5);
                [obj.subviews[0] removeFromSuperview];
                [obj addSubview:lineView];
                
            }
        }];
    }else {
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"UIImageView")]) {
                if (obj.frame.size.height < 1) {
                    lineView.frame = CGRectMake(0, 0, k_WIDTH, 0.5);
                    [obj removeFromSuperview];
                    [obj.superview addSubview:lineView];
                }
            }
        }];
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
