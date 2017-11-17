//
//  RSFirstTypeCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/17.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstTypeCell.h"

@implementation RSFirstTypeCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle]loadNibNamed:@"RSFirstTypeCell" owner:self options:nil].lastObject;
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
