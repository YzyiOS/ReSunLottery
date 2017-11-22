//
//  RSNarBtnCollectionCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSNarBtnCollectionCell.h"

@implementation RSNarBtnCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle]loadNibNamed:@"RSNarBtnCollectionCell" owner:self options:nil].lastObject;
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
