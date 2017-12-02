//
//  RSScoreTableCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/28.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSScoreTableCell.h"
@interface RSScoreTableCell()

@property (nonatomic, strong) UILabel *labQiCi;//期次

@property (nonatomic, strong) UILabel *labTime;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *labHome;

@property (nonatomic, strong) UILabel *labScore;

@property (nonatomic, strong) UIImageView *imgScore;

@property (nonatomic, strong) UILabel *labGues;

@property (nonatomic, strong) UILabel *halfScore;

@property (nonatomic, strong) UIView *basView;//底部View


@end


@implementation RSScoreTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.labQiCi];
        [self.contentView addSubview:self.labTime];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.imgScore];
        [self.contentView addSubview:self.labScore];
        [self.contentView addSubview:self.labHome];
        [self.contentView addSubview:self.labGues];
        [self.contentView addSubview:self.halfScore];
        [self.contentView addSubview:self.basView];
        
        [self setLayoutUI];
    }
    return self;
}
- (UILabel *)labQiCi{
    if (!_labQiCi) {
        _labQiCi = [[UILabel alloc] init];
        _labQiCi.textColor = K_BlockTextColor;
        _labQiCi.font = RSFont(16);
        _labQiCi.text = @"32";
    }
    return _labQiCi;
}
- (UILabel *)labTime{
    if (!_labTime) {
        _labTime = [[UILabel alloc] init];
        _labTime.font = RSFont(15);
        _labTime.textColor = K_77777BlockTextColor;
        _labTime.text = @"adf";
    }
    return _labTime;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = K_GRAY_BG_COLOR;
    }
    return _lineView;
}
- (UILabel *)labHome{
    if (!_labHome) {
        _labHome = [[UILabel alloc] init];
        _labHome.textColor = K_BlockTextColor;
        _labHome.font = RSFont(17);
        _labHome.text = @"甲级队";
    }
    return _labHome;
    
}
- (UILabel *)labGues{
    if (!_labGues) {
        _labGues = [[UILabel alloc] init];
        _labGues.textColor = K_BlockTextColor;
        _labGues.font = RSFont(17);
        _labGues.text = @"啊激动";
    }
    return _labGues;
    
}
- (UILabel *)labScore{
    if (!_labScore) {
        _labScore = [[UILabel alloc] init];
        _labScore.font = RSFont(17);
        _labScore.textColor = [UIColor whiteColor];
        _labScore.text = @"3:9";
    }
    return _labScore;
}
- (UIImageView *)imgScore{
    if (!_imgScore) {
        _imgScore = [[UIImageView alloc] init];
        _imgScore.image = RSImage(@"scores_icon_end");
    }
    return _imgScore;
}

- (UILabel *)halfScore{
    if (!_halfScore) {
        _halfScore = [[UILabel alloc] init];
        _halfScore.textColor = K_77777BlockTextColor;
        _halfScore.font = RSFont(15);
    }
    return _halfScore;
}
- (UIView *)basView{
    if (!_basView) {
        _basView = [[UIView alloc] init];
        _basView.backgroundColor = K_GRAY_BG_COLOR;
    }
    return _basView;
}
- (void)setModel:(RSMatchModel *)model{
    _model = model;
    self.labQiCi.text = [NSString stringWithFormat:@"%@   %@",model.mid,model.league];
//    self.labTime.text =
    self.labHome.text = model.hname;
    self.labGues.text = model.gname;
    self.labScore.text = model.score;
    self.labTime.text = model.sdesc;
    self.halfScore.text = model.hsocre;
//    "state": 0,//状态(0:未开,1:上半场,2:中场,3:下半场,4,加时，-11:待定,-12:腰斩,-13:中断,-14:推迟,-1:完场，-10取消)
    
    switch ([model.state integerValue]) {
        case -1://完场
            
            break;
        case 0://未开
            
            break;
        case 1://上半场
            
            break;
        case 2://中场
            
            break;
        case 3://下半场
            
            break;
        case 4://加时
            
            break;
        case -11://待定
            
            break;
        case -12://腰斩
            
            break;
        case -13://中断
            
            break;
        case -14://推迟
            
            break;
        case -10://取消
            
            break;
            
        default:
            break;
    }
    
    
}
- (void)setLayoutUI{
    
    [self.labQiCi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
        
    }];
    [self.labTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labQiCi.mas_bottom).offset(15);
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.offset(1);
    }];
    [self.imgScore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(16);
        make.height.offset(40);
        make.width.offset(41);
    }];
    
    [self.labHome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.imgScore.mas_left).offset(-15);
        make.centerY.mas_equalTo(self.labScore.mas_centerY);
    }];
    
    [self.labGues mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgScore.mas_right).offset(15);
        make.top.mas_equalTo(self.labHome.mas_top);
    }];
    [self.labScore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.imgScore.mas_centerX);
        make.centerY.mas_equalTo(self.imgScore.mas_centerY).offset(3);
    }];
    
    [self.halfScore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.top.mas_equalTo(self.labHome.mas_top);
    }];
    
    [self.basView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.height.offset(10);
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
