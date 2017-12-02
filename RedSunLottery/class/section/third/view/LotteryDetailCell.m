//
//  LotteryDetailCell.m
//  RedSunLottery
//
//  Created by Marjoice on 17/11/2017.
//  Copyright © 2017 RedSun. All rights reserved.
//

#import "LotteryDetailCell.h"
#import "RSBaseCaiBallButton.h"

#define MARGIN                                     5

#define DOUBLEBALL_BTN_HEIGHT                      17       // 双色球 + 11选5 等宽高
#define VICTORY_BTN_HEIGHT                         13.5
#define VICTORY_BTN_WIDTH                          10
#define BALL_BTN_WIDTH                             149
#define BALL_BTN_HEIGHT                            17.5

@interface LotteryDetailCell ()
@property (strong, nonatomic)  UIButton                     *btnNums;
@property (strong, nonatomic)  NSMutableArray               *arrDoubleBall;

@end

@implementation LotteryDetailCell {
    
    int   _count;
}
- (void)setModel:(periodTitleModel *)model{
    [self.contentView removeAllSubviews];
    _model = model;
    self.lotteryType = (LotteryType)[model.lid integerValue];
    [self buildElements];
}

//调用前先为 _count 赋值
- (void)buildElements {
    
    _count = 7;
    self.btnNums = [UIButton buttonWithType:UIButtonTypeCustom];
    self.arrDoubleBall = [NSMutableArray arrayWithCapacity:_count];
    if (self.lotteryType == LotteryTypeDoubleChromospheric) {//双色球
        NSArray *arr = [RSTools backKcodeModel:self.model.kcode];
        for (NSInteger i = arr.count - 1; i >= 0; i--) {
            RSkCodeModel *codeModel = arr[i];
            RSBaseCaiBallButton *btn = [[RSBaseCaiBallButton alloc] initWithFrame:CGRectMake(k_WIDTH - (15 + 34) - (34 + 9) * (arr.count - i - 1 ), 14, 34, 34) nalColor:codeModel.numColor selectColor:codeModel.numColor titleStr:codeModel.num];
            btn.selected = YES;
            btn.userInteractionEnabled = NO;//关闭点击手势
//            btn.enabled = NO;
            [self.contentView addSubview:btn];
            
        }
    }else if (self.lotteryType == LotteryTypeGDFiveIn || self.lotteryType == LotteryTypeSDFiveIn || self.lotteryType == LotteryTypeSHFiveIn) {//11选五
        NSArray *arr = [self.model.kcode componentsSeparatedByString:@","];
        for (NSInteger i = arr.count - 1; i >= 0; i --) {
            RSBaseCaiBallButton *btn = [[RSBaseCaiBallButton alloc] initWithFrame:CGRectMake(k_WIDTH - (15 + 34) - (34 + 9) * (arr.count - i - 1 ), 14, 34, 34) nalColor:Color_double_red selectColor:Color_double_red titleStr:arr[i]];
            btn.selected = YES;
            btn.userInteractionEnabled = NO;
            [self.contentView addSubview:btn];
        }
    }else if (self.lotteryType == LotteryTypeVictory) {////胜负彩
        NSArray *arr = [self.model.kcode componentsSeparatedByString:@","];
        for (NSInteger i = arr.count - 1; i >= 0; i --) {
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(k_WIDTH - 15 - 20 - (20 + 4) * (arr.count - i - 1 ) , 15, 20 , 27)];
            lab.layer.cornerRadius = 4;
            lab.layer.masksToBounds = YES;
            lab.backgroundColor = Color_double_red;
            lab.textAlignment = NSTextAlignmentCenter;
            lab.textColor = [UIColor whiteColor];
            lab.text = arr[i];
            [self.contentView addSubview:lab];
        }
        
    }else if(self.lotteryType == LotteryTypeFootBall || self.lotteryType == LotteryTypeBasktBall){
        UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(k_WIDTH-15 - 300, 15, 300, 35)];
        baseView.layer.cornerRadius = 35/2;
        if (self.lotteryType == LotteryTypeFootBall) {//竞彩足球和篮球显示的颜色不一样
            baseView.backgroundColor = Color_football_green;
            
        }else{
            baseView.backgroundColor = Color_basktball_org;
        }
        UILabel *lab = [[UILabel alloc] init];
        lab.textColor = [UIColor whiteColor];
        lab.font = RSFont(15);
        lab.text = [NSString stringWithFormat:@"%@ %@ %@",self.model.hname,self.model.bf,self.model.gname];
        [self.contentView addSubview:baseView];
        [baseView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(baseView.mas_centerY);
            make.centerX.mas_equalTo(baseView.mas_centerX);
        }];
    }else if (self.lotteryType == LotterTypeBask3D || self.lotteryType == LotterTypeBask3D || self.lotteryType == LotterTypeCQQSSCai || self.lotteryType == LotteryTypeAnHuiKuai3 || self.lotteryType == LotteryTypePaiLie3 || self.lotteryType == LotteryTypeJiLingKuai3 || self.lotteryType == LotteryTypeJiangSuKusai3){
        NSLog(@"%@",self.model.kcode);
        NSArray *arr = [self.model.kcode componentsSeparatedByString:@","];
        for (NSInteger i = arr.count - 1; i >= 0; i --) {
            RSBaseCaiBallButton *btn = [[RSBaseCaiBallButton alloc] initWithFrame:CGRectMake(k_WIDTH - (15 + 34) - (34 + 9)  * (arr.count - i - 1 ), 14, 34, 34) nalColor:Color_double_red selectColor:Color_double_red titleStr:arr[i]];
            btn.selected = YES;
            btn.userInteractionEnabled = NO;
            [self.contentView addSubview:btn];
        }
    }
}


@end
