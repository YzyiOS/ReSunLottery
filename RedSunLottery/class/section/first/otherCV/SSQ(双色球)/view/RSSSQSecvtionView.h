//
//  RSSSQSecvtionView.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/22.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSSQZSModel.h"
#import "RSSSQLSModel.h"

typedef void(^SelectedBtnBlock)(BOOL select);

@interface RSSSQSecvtionView : UIView

@property (nonatomic, assign) BOOL select;

@property (nonatomic, copy) SelectedBtnBlock selectbtnType;

@property (nonatomic, strong)RSSSQZSModel  *zsModel;

@property (nonatomic, strong)RSSSQLSModel  *lsModel;

@end
