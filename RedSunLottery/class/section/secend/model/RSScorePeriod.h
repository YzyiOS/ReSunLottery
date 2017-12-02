//
//  RSScorePeriod.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/30.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSMatchModel.h"

@interface RSScorePeriod : NSObject

@property (nonatomic, copy) NSString *period;

@property (nonatomic, copy) NSString *show;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSArray<RSMatchModel *> *arrMatch;

@end
