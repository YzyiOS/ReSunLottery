//
//  RSNarBtnCollectionView.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RSNarBtnCollectionViewDelegate
- (void)backSelectNum:(NSInteger)num;

@end



@interface RSNarBtnCollectionView : UIViewController

//+ (RSNarBtnCollectionView *)sharedInstance;
@property (nonatomic, copy) NSArray  *modelArr;


@property (nonatomic, weak) id<RSNarBtnCollectionViewDelegate> delegate;


@end
