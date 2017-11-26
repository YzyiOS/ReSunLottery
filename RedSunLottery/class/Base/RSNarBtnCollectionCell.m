//
//  RSNarBtnCollectionCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSNarBtnCollectionCell.h"
@interface RSNarBtnCollectionCell()

@property (weak, nonatomic) IBOutlet UIButton *btnNarTitle;


@end

@implementation RSNarBtnCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle]loadNibNamed:@"RSNarBtnCollectionCell" owner:self options:nil].lastObject;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUIIndepathNum:(NSInteger)row{
    self.btnNarTitle.layer.cornerRadius = (self.height - 5) / 2;
    self.btnNarTitle.layer.borderWidth = 1;
    self.btnNarTitle.tag = row;
    self.btnNarTitle.layer.masksToBounds = YES;
    self.btnNarTitle.selected = self.selectBtn;
    if (self.selectBtn) {
        self.btnNarTitle.layer.borderColor  = K_RedTextColor.CGColor;
        self.btnNarTitle.backgroundColor = K_RedTextColor;
    }else{
        self.btnNarTitle.layer.borderColor = K_77777BlockTextColor.CGColor;
        self.btnNarTitle.backgroundColor = [UIColor whiteColor];
        
    }
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    [self.btnNarTitle setTitle:titleStr forState:UIControlStateNormal];
    
}
- (IBAction)clickBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.btnNarTitle.layer.borderColor  = K_RedTextColor.CGColor;
        self.btnNarTitle.backgroundColor = K_RedTextColor;
    }else{
        sender.selected = YES;
    }

    [self.delegate backSelectBtn:sender.tag];
    
    
//    else{
//        self.btnNarTitle.layer.borderColor  = K_77777BlockTextColor.CGColor;
//        self.btnNarTitle.backgroundColor = [UIColor whiteColor];
//    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
