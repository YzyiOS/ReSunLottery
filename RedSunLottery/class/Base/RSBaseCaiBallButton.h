//
//  RSBaseCaiBallButton.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/20.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSBaseCaiBallButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame nalColor:(UIColor *)nalColor selectColor:(UIColor *)selectColor titleStr:(NSString *)strTitle;

@property (nonatomic, assign) BOOL selectBtn;
@end
