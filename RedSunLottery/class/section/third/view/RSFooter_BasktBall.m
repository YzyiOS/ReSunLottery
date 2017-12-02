//
//  RSFooter_BasktBall.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFooter_BasktBall.h"

@interface RSFooter_BasktBall(){
    NSArray *_arrTitle;
    NSArray *_arr;
    CGFloat _wid;
    
}

@property (nonatomic, strong) UILabel *labQiCi;

@property (nonatomic, strong) UILabel *labHome;

@property (nonatomic, strong) UILabel *labGName;

@property (nonatomic, strong) UILabel *labBF;

@property (nonatomic, strong) UILabel *labBBF;//半场比分（足球的时候显示）

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSArray *arrStr;

@property (nonatomic, strong) UIView *botomView;

@property (nonatomic, strong) UIView *BsaeView;




@end

@implementation RSFooter_BasktBall

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.labQiCi];
        [self.contentView addSubview:self.labBBF];
        [self.contentView addSubview:self.labGName];
        [self.contentView addSubview:self.labBF];
        [self.contentView addSubview:self.labHome];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.BsaeView];
        [self.contentView addSubview:self.botomView];
        [self setLayoutUI];
    }
    return self;
}
- (UILabel *)labQiCi{
    if (!_labQiCi) {
        _labQiCi = [[UILabel alloc] init];
        _labQiCi.font = RSFont(15);
        _labQiCi.textColor = K_BlockTextColor;
        _labQiCi.text = @"37434";
    }
    return _labQiCi;
}
- (UILabel *)labBBF{
    if (!_labBBF) {
        _labBBF = [[UILabel alloc] init];
        _labBBF.textColor = K_77777BlockTextColor;
        _labBBF.font = RSFont(14);
    }
    return _labBBF;
}
- (UILabel *)labGName{
    if (!_labGName) {
        _labGName = [[UILabel alloc] init];
        _labGName.font = RSFont(15);
        _labGName.textColor = K_BlockTextColor;
        _labGName.text = @"";
    }
    return _labGName;
}
- (UILabel *)labBF{
    if (!_labBF) {
        _labBF = [[UILabel alloc] init];
        _labBF.font = RSFont(15);
        _labBF.textColor = K_RedTextColor;
        _labBF.text = @"1:2";
    }
    return _labBF;
}
- (UILabel *)labHome{
    if (!_labHome) {
        _labHome = [[UILabel alloc] init];
        _labHome.textColor = K_BlockTextColor;
        _labHome.font = RSFont(15);
    }
    return _labHome;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = K_GRAY_BG_COLOR;
        
    }
    return _lineView;
}
- (UIView *)botomView{
    if (!_botomView) {
        _botomView = [[UIView alloc] init];
        _botomView.backgroundColor = K_GRAY_BG_COLOR;
    }
    return _botomView;
}
- (UIView *)BsaeView{
    if (!_BsaeView) {
        _BsaeView = [[UIView alloc] init];
        _BsaeView.backgroundColor = [UIColor whiteColor];
    }
    return _BsaeView;
}
- (void)setModel:(RSFooter_BasBallValueModel *)model{
    _model = model;
    self.labQiCi.text = model.mtime;
    if (self.type == 1700) {
        self.labBBF.text = [NSString stringWithFormat:@"       半%@",model.hscore];
    }else{
        self.labBBF.text = @"";
        
    }
    
    self.labGName.text = model.gname;
    self.labBF.text = model.score;
    self.labHome.text = model.hname;
//   spfr      rqspfr   zjqr   bfr  bqcr
    if (self.type == 1700) {//足球
        _wid = k_WIDTH / 5;
        _arrTitle = @[model.spfr,model.rqspfr,model.zjqr,model.bfr,model.bqcr];
        _arr = @[model.spfs,model.rqspfs,model.zjqs,model.bfs,model.bqcs];
        
    }else{
        _wid = k_WIDTH / 4;
        _arrTitle = @[model.sfr,model.rfsfr,model.dxfr,model.sfcr];
        _arr = @[model.sfs,model.rfsfs,model.dxfs,model.sfcs];
    }
    [self.BsaeView removeAllSubviews];
    for (int i = 0;  i < _arrTitle.count; i ++) {
        UILabel *labTitle = [[UILabel alloc] initWithFrame:CGRectMake(i * _wid, 15, _wid,15)];
        labTitle.textColor = K_BlockTextColor;
        labTitle.textAlignment = NSTextAlignmentCenter;
        labTitle.font = RSFont(14);
        labTitle.text = _arrTitle[i];
        [self.BsaeView addSubview:labTitle];
    }
    for (int i = 0; i < _arr.count; i ++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(i * _wid, 45, _wid, 15)];
        lab.textColor = K_RedTextColor;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = RSFont(14);
        lab.text = _arr[i];
        [self.BsaeView addSubview:lab];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(lab.left, 40, 1, 25)];
        line.backgroundColor = K_GRAY_BG_COLOR;
        if (i == _arr.count) {
            
        }else{
            [self.BsaeView addSubview:line];
            
        }
    }
    
    
}
- (void)setLayoutUI{
    [self.labQiCi mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
    }];
    [self.labBBF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.top.mas_equalTo(self.labQiCi.mas_top);
    }];
    
    [self.labGName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.labBBF.mas_left);
        make.top.mas_equalTo(self.labQiCi.mas_top);
    }];
    [self.labBF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.labGName.mas_left).offset(-10);
            make.top.mas_equalTo(self.labQiCi.mas_top);
    }];
    [self.labHome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.labBF.mas_left).offset(-10);
        make.top.mas_equalTo(self.labQiCi.mas_top);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labQiCi.mas_bottom).offset(15);
        make.left.mas_equalTo(self.labQiCi.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_offset(1);
    }];
    [self.botomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.height.offset(10);
    }];
    [self.BsaeView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.botomView.mas_top);
        make.top.mas_equalTo(self.lineView.mas_bottom);
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
