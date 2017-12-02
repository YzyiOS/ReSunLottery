//
//  RSFooter_BasktBallModel.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSFooter_BasBallValueModel.h"

@interface RSFooter_BasktBallModel : NSObject

@property (nonatomic, copy) NSString *key;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSArray<RSFooter_BasBallValueModel *> *value;

@end
