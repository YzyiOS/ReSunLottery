//
//  RSFirstTypeCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/17.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstTypeCell.h"
@interface RSFirstTypeCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *labName;

@property (weak, nonatomic) IBOutlet UILabel *labDesc;

@end

@implementation RSFirstTypeCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle]loadNibNamed:@"RSFirstTypeCell" owner:self options:nil].lastObject;
        
    }
    return self;
}
- (void)setModel:(RSFirstLotteryModel *)model{
    _model = model;
    
    [_iconImg sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    self.labName.text = model.name;
    self.labDesc.text = model.desc;
    if ([model.open integerValue]) {
        self.labDesc.layer.cornerRadius = self.labDesc.height/2;
        self.labDesc.layer.masksToBounds = YES;
        self.labDesc.backgroundColor = [UIColor colorWithHexString:@"#ff8c00"];
        self.labDesc.textColor = [UIColor whiteColor];
    }else{
        self.labDesc.backgroundColor = [UIColor whiteColor];
        self.labDesc.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
