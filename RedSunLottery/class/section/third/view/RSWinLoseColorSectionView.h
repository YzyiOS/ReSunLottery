//
//  RSWinLoseColorSectionView.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/29.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSWinLoseColorModel.h"

typedef void(^SelectedBtnBlock)(NSDictionary *select);

@interface RSWinLoseColorSectionView : UIView

@property (nonatomic, assign) NSInteger selectEnd;

@property (nonatomic, copy) SelectedBtnBlock selectBtn;

@property (nonatomic, assign) NSInteger sectionNum;

- (void)returnSelectEnd:(SelectedBtnBlock)block;

@property (nonatomic, strong) RSWinLoseColorModel *model;

@end
