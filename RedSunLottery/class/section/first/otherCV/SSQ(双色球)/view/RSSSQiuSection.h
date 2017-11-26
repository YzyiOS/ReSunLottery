//
//  RSSSQiuSection.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/24.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, PlayType) {
    PlayTypeSSQ    = 0, // 双色球
    PlayTypeDLT  = 1, // 大乐透
};

typedef NS_OPTIONS(NSUInteger, ColorType) {
    ColorTypeRed    = 0, // 红色
    ColorTypeBlue  = 1, // 蓝色
};

typedef void(^SelectedBtnArrBlock)(NSArray *arr);

@interface RSSSQiuSection : UITableViewCell

@property (nonatomic, retain) UIColor *nalColor;

@property (nonatomic, assign) PlayType playType;
@property (nonatomic, assign) ColorType colorType;

@property (nonatomic, copy) SelectedBtnArrBlock arr;

@property (nonatomic, strong) NSArray *selectBallArr;

@property (nonatomic, retain) NSString *titleStr;

- (void)setUI:(NSInteger)count;

@end
