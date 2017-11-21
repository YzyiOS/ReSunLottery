//
//  RSFirstBannerView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/16.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstBannerView.h"
#import "SDCycleScrollView.h"
#import "RSFirstBannerModel.h"
#import "RSBannerWebVC.h"

@interface RSFirstBannerView()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) UIView *viewBack;

@property (nonatomic, strong) UIImageView *imgAnnouncementIcon;

@property (nonatomic, strong) UIButton *btnAnnouncement;

@end

@implementation RSFirstBannerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = K_GRAY_BG_COLOR;
        [self setUI];
    }
    return self;
}
- (void)setBannerArr:(NSArray *)bannerArr{
    _bannerArr = bannerArr;
    
    [self setData];
}
- (void)setData{
    NSMutableArray *arrayM = @[].mutableCopy;
    [self.bannerArr enumerateObjectsUsingBlock:^(RSFirstBannerModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [arrayM addObject:obj.pictureUrl];
    }];
    _cycleScrollView.imageURLStringsGroup = arrayM.copy;
}

- (void)setUI{
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, k_WIDTH, self.height - 36 - 10)
                                                          delegate:self
                                                  placeholderImage:[UIImage imageWithColor:K_GRAY_BG_COLOR size:CGSizeMake(1, 1)]];
    _cycleScrollView.currentPageDotColor = K_GRAY_BG_COLOR;
    _cycleScrollView.pageDotColor = [UIColor whiteColor];
    _cycleScrollView.autoScrollTimeInterval = 5;
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_cycleScrollView];
    
    _viewBack = [[UIView alloc] initWithFrame:CGRectMake(0, 174, k_WIDTH, 36)];
    _viewBack.backgroundColor = [UIColor whiteColor];
    [self addSubview:_viewBack];
    
    _imgAnnouncementIcon = [[UIImageView alloc] init];
    _imgAnnouncementIcon.image = [UIImage imageNamed:@"home_tz"];
    [_viewBack addSubview:_imgAnnouncementIcon];
    [_imgAnnouncementIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.centerY.mas_equalTo(_viewBack.mas_centerY);
        make.width.height.mas_offset(15);
    }];
    
    _btnAnnouncement = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnAnnouncement setTitle:@"德高望重" forState:UIControlStateNormal];
     _btnAnnouncement.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _btnAnnouncement.titleLabel.font = RSFont(13);
    [_btnAnnouncement setTitleColor:K_lightTextColor forState:UIControlStateNormal];
    [_viewBack addSubview:_btnAnnouncement];
    [_btnAnnouncement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imgAnnouncementIcon.mas_right).offset(7.5);
        make.top.mas_equalTo(_viewBack.mas_top);
        make.right.mas_equalTo(_viewBack.mas_right).offset(-15);
        make.height.mas_equalTo(_viewBack.mas_height);
    }];
    
    
}
- (void)updateConstraints{
    [super updateConstraints];
   
}
#pragma mark -- 点击banner
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    RSFirstBannerModel *model = _bannerArr[index];
    RSBannerWebVC *vc = [[RSBannerWebVC alloc] init];
    vc.content = model.content;
    [[RSTools getTopVC].navigationController pushViewController:vc animated:YES];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
