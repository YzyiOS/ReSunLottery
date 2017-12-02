//
//  RSLottertFooter_BascktSectionView.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSFooter_BasktBallModel.h"

typedef void(^SelectedBtnBlock)(NSDictionary *select);

@interface RSLottertFooter_BascktSectionView : UIView

@property (nonatomic, strong) NSString  *title;

@property (nonatomic, copy) SelectedBtnBlock selectBtn;

@property (nonatomic, assign) NSInteger selectEnd;

@property (nonatomic, assign) NSInteger sectionNum;

- (void)returnSelectEnd:(SelectedBtnBlock)block;

@end
