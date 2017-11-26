//
//  RSSSQZSModel.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/25.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSSQZSModel : NSObject

@property (nonatomic, copy) NSString *etime;//结束时间

@property (nonatomic, copy) NSString *gc;//滚存

@property (nonatomic, copy) NSString *lid;//彩种编号

@property (nonatomic, copy) NSString *lname;//彩种名称

@property (nonatomic, copy) NSString *pid;//期次号

@property (nonatomic, copy) NSString *pname;//期次名称

@property (nonatomic, copy) NSString *setime;//截止时间

@property (nonatomic, copy) NSString *stime;//开售时间

@property (nonatomic, copy) NSString *statusTime;//判断是否时间有误

@end
