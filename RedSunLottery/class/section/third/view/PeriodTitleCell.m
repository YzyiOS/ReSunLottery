//
//  PeriodTitleCell.m
//  RedSunLottery
//
//  Created by Marjoice on 17/11/2017.
//  Copyright © 2017 RedSun. All rights reserved.
//

#import "PeriodTitleCell.h"

@interface PeriodTitleCell ()
@property (strong, nonatomic)   UILabel                  *labName;
@property (strong, nonatomic)   UILabel                  *labData;
@property (strong, nonatomic)   UILabel                  *labPeriod;      // 期次
@property (strong, nonatomic)   UIImageView              *imgrol;

@end

@implementation PeriodTitleCell

/*
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildElements];
        [self addLayOut];
    }
    return self;
}
*/

- (void)setPeriodModel:(periodTitleModel *)periodModel {
    
    _periodModel = periodModel;
    [self buildElements];
    
    [self addLayOut];
    
    _periodModel  = periodModel;
    self.labData.text = periodModel.ktime;
    self.labPeriod.text = periodModel.pname;
    self.labName.text = periodModel.lname;
}

- (void)buildElements {
    
    [self.contentView addSubview:self.labName];
    [self.contentView addSubview:self.imgrol];
    [self.contentView addSubview:self.labPeriod];
    [self.contentView addSubview:self.labData];
}


- (UILabel *)labName {
    
    if (!_labName) {
        _labName = [UILabel new];
        _labName.text = @"测试";
        _labName.font = [UIFont systemFontOfSize:16];
    }
    return _labName;
}
- (UILabel *)labPeriod {
    
    if (!_labPeriod) {
        _labPeriod = [UILabel new];
        _labPeriod.text = @"17105期";
        _labPeriod.font = [UIFont systemFontOfSize:14];
    }
    return _labPeriod;
}
- (UILabel *)labData {
    
    if (!_labData) {
        _labData = [UILabel new];
        _labData.text = @"2017-11-02 周四";
        _labData.font = [UIFont systemFontOfSize:14];
    }
    return _labData;
}
- (UIImageView *)imgrol {
    
    if (!_imgrol) {
        _imgrol = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lottery_icon_particulars"]];
    }
    return _imgrol;
}

- (void)addLayOut {
    
    [self.labName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView).offset(15);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.imgrol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.contentView).offset(-15);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.labPeriod mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.imgrol.mas_leading).offset(-15);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.labData mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.labPeriod.mas_leading).offset(-15);
        make.centerY.mas_equalTo(self.contentView);
    }];
}

@end
