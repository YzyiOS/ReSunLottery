//
//  RSSSQiuSection.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/24.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSSQiuSection.h"
#import "RSBaseCaiBallButton.h"

@interface RSSSQiuSection()

@property (weak, nonatomic) IBOutlet UIButton *btnShake;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (nonatomic, retain) NSMutableArray *arrBtnAll;//存放所有的按钮
@property (nonatomic, retain) NSMutableArray *selectArrBall;//存放选中的按钮

@end


@implementation RSSSQiuSection

- (void)setUI:(NSInteger)count{
    _arrBtnAll = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.labTitle.text = self.titleStr;
    if (self.colorType) {
        self.btnShake.hidden = YES;
        
    }else{
        self.btnShake.hidden = NO;
        
    }
    for (UIView *viewbtn in self.contentView.subviews) {
        if ([viewbtn isKindOfClass:[UIButton class]] && viewbtn.tag != 100) {
            [viewbtn removeFromSuperview];
        }
    }
    self.lineView.backgroundColor = _nalColor;
    CGFloat wid = (k_WIDTH - 30 - 34 * 8) / 7;
    for (int i = 1; i <= count; i ++) {
        RSBaseCaiBallButton *btn = [[RSBaseCaiBallButton alloc] initWithFrame:CGRectMake(15+(34 + wid) * ((i - 1)%8), self.btnShake.bottom + 15 + ((i - 1)/8)*(34 + 12), 34, 34) nalColor:self.nalColor selectColor:self.nalColor titleStr:i < 10?[NSString stringWithFormat:@"0%d",i]:[NSString stringWithFormat:@"%d",i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        [_arrBtnAll addObject:btn];
    }
}
- (void)setSelectBallArr:(NSArray *)selectBallArr{
    _selectBallArr = selectBallArr;
    
    for (int i = 0; i < _arrBtnAll.count; i ++) {
        RSBaseCaiBallButton *btn = _arrBtnAll[i];
        for (int j = 0; j < selectBallArr.count; j++){
            NSString *selectBtnTag = [selectBallArr objectAtIndex:j];
            if ([btn.titleLabel.text isEqualToString:selectBtnTag]) {
                btn.selected = YES;
            }
        }
    }
    
}
- (void)clickBtn:(UIButton *)sender{
    sender.selected = !sender.selected;
    NSString *btnTag = sender.titleLabel.text;
    
    
//    if ([_selectArrBall containsObject:btnTag]) {
//        if (!sender.selected) {
//            [_selectArrBall removeObject:btnTag];
//        }
//    }else{
//        
//        [_selectArrBall addObject:btnTag];
//        
//    }
    self.arr(btnTag);
    
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
