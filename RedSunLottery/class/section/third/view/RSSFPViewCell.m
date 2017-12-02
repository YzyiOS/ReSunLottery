//
//  RSSFPViewCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/12/1.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSFPViewCell.h"

#import "RSWinLoseOtherCellView.h"

@interface RSSFPViewCell()

@property (nonatomic, strong) RSWinLoseOtherCellView *otherView;

@property (nonatomic, strong) RSWinLoseOtherCellView *otherViewTwo;

@end

@implementation RSSFPViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self.contentView addSubview:self.otherView];
        [self.contentView addSubview:self.otherViewTwo];
        [self setLayoutUI];
    }
    return self;
}

-(RSWinLoseOtherCellView *)otherView{
    if (!_otherView) {
        _otherView = [[RSWinLoseOtherCellView alloc] init];
        
        _otherView.titleColor = K_BlockTextColor;
        _otherView.nalColor = K_BlockTextColor;
    }
    
    return _otherView;
}

- (RSWinLoseOtherCellView *)otherViewTwo{
    if (!_otherViewTwo) {
        _otherViewTwo = [[RSWinLoseOtherCellView alloc] init];
        _otherViewTwo.titleColor = K_BlockTextColor;
        _otherViewTwo.nalColor = K_77777BlockTextColor;
    }
    return _otherViewTwo;
    
}
- (void)setModel:(RSWinLoseColorModel *)model{
    _model = model;
    NSMutableArray *arrOne = [[NSMutableArray alloc] initWithCapacity:0];
    
    if ([self.lid isEqualToString:@"1010"]) {
        
        for (int i = 0; i < model.pclist.count; i ++) {
            NSDictionary *dic = model.pclist[i];
            NSArray *arr = @[dic[@"xl"],dic[@"gc"]];
            [arrOne addObject:arr];
        }
    }else{
        for (int i = 0; i < 1; i ++) {
            NSArray *arr = @[@"-",@"-"];
            [arrOne addObject:arr];
        }
        
    }
    
    self.otherView.arrContent = arrOne;
    self.otherView.titleArr = @[@"本期销量",@"本期滚存"];
    [self.otherView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset(95 / 3 *(arrOne.count + 1));
    }];
    
    NSMutableArray *arrTwo = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < model.pglist.count; i ++) {
        
        NSDictionary *dic = model.pglist[i];
        NSArray *arr = @[dic[@"pname"],dic[@"items"][@"dz"],dic[@"items"][@"zs"]];
        [arrTwo addObject:arr];
    }
    
    self.otherViewTwo.arrContent = arrTwo;
    self.otherViewTwo.titleArr = @[@"等级",@"奖金(税前)",@"全国注数"];
    [self.otherViewTwo mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset(95 / 3 *(arrTwo.count + 1));
    }];
}

- (void)setLayoutUI{
    
    [self.otherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.height.mas_offset(100);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
    }];
    [self.otherViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.otherView.mas_left);
        make.right.mas_equalTo(self.otherView.mas_right);
        make.top.mas_equalTo(self.otherView.mas_bottom).offset(10);
        make.height.mas_offset(110);
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
