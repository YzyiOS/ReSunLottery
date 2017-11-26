//
//  RSSQiuFirstCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/23.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSQiuFirstCell.h"
#import "RSSSQNumLabView.h"
#import "RSkCodeModel.h"
#import "RSSSQLSModel.h"

@interface RSSQiuFirstCell()

@property (nonatomic, strong)UIView *blueBottomView;

@property (nonatomic, strong) NSArray *arrTitle;

@property (nonatomic, strong) RSSSQNumLabView *labNumView;

@end

@implementation RSSQiuFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = K_GRAY_BG_COLOR;
        _arrTitle = @[@"期号",@"开奖号码",@"大小比",@"奇偶比"];
        [self.contentView addSubview:self.blueBottomView];
        [self setLayoutView];
    }
    return self;
    
}
- (UIView *)blueBottomView{
    if (!_blueBottomView) {
        _blueBottomView = [[UIView alloc] init];
        _blueBottomView.backgroundColor = [UIColor colorWithHexString:@"#cee4ff"];
        _blueBottomView.layer.cornerRadius = 4;
    }
    return _blueBottomView;
    
}
- (void)setArrContent:(NSArray *)arrContent{
    CGFloat wid = (k_WIDTH - 30)/ 5;
    [self.blueBottomView removeAllSubviews];
    for (int j = 0; j < arrContent.count + 1; j ++) {
        CGFloat viewRight = 0;
        if (j == 0) {
            for (int i = 0; i < 4; i ++) {
                UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(viewRight +(i == 1 ? 5:0), 15 + 30 * j, i == 1 ? (21.5 * 7 + 15): (wid - 5), 15)];
                lab.text = _arrTitle[i];
                lab.textColor = K_BlockTextColor;
                lab.font = RSFont(14);
                lab.textAlignment = NSTextAlignmentCenter;
                [self.blueBottomView addSubview:lab];
                viewRight = lab.right;
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewRight, 30 * j, 0.6, 40)];
                view.backgroundColor = [UIColor whiteColor];
                if (i == 3) {
                    
                }else{
                    [self.blueBottomView addSubview:view];
                }
            }
        }else{
            RSSSQLSModel *model = arrContent[j - 1];
            for (int i = 0; i < 4; i ++) {
                
                if (i == 1) {
                    RSSSQNumLabView *viewLabArr = [[RSSSQNumLabView alloc] initWithFrame:CGRectMake(viewRight + 5, 15 + 30 * j, 21.5 * 7 + 15, 15)];
                    if ([model.kcode isEqualToString:@"等待开奖."]) {
                        viewLabArr.arrModel = [RSTools backKcodeModel:@"00,00,00,00,00|00,00"];
                    }else{
                        viewLabArr.arrModel = [RSTools backKcodeModel:model.kcode];
                        
                    }
                    
                    [self.blueBottomView addSubview:viewLabArr];
                    viewRight = viewLabArr.right;
                }else{
                    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(viewRight, 15 + 30 * j, wid - 5, 15)];
                    switch (i) {
                        case 0:
                            lab.text = model.pid;
                            break;
                        case 2:
                            lab.text = model.dxScale;
                            break;
                        case 3:
                            lab.text = model.joScale;
                            break;
                            
                        default:
                            break;
                    }
                    
                    lab.textColor = K_BlockTextColor;
                    lab.font = RSFont(14);
                    lab.textAlignment = NSTextAlignmentCenter;
                    [self.blueBottomView addSubview:lab];
                    viewRight = lab.right;
                    
                }
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewRight, 30 * j, 0.6, 40)];
                view.backgroundColor = [UIColor whiteColor];
                if (i == 3) {
                    
                }else{
                    [self.blueBottomView addSubview:view];
                }
            
        }
        }

    }
    
//    for (int i = 0; i < 3; i ++ ) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(wid * (i+1>1?i+2:i+1), 0, 0.6, 130)];
//        view.backgroundColor = [UIColor whiteColor];
//        [self.blueBottomView addSubview:view];
//    }
    
    
    
}
- (void)setLayoutView{
    [self.blueBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
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
