//
//  RSFirstBannerView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/16.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstBannerView.h"
#import "SDCycleScrollView.h"

@interface RSFirstBannerView()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;


@end

@implementation RSFirstBannerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setUI];
        
    }
    return self;
}


- (void)setUI{
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero
                                                          delegate:self
                                                  placeholderImage:[UIImage imageWithColor:K_GRAY_BG_COLOR size:CGSizeMake(1, 1)]];
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    _cycleScrollView.pageDotColor = [UIColor whiteColor];
    _cycleScrollView.autoScrollTimeInterval = 5;
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_cycleScrollView];
//    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(0);
//    }];
}
- (void)updateConstraints{
    [super updateConstraints];
   
}
#pragma mark -- 点击banner
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
