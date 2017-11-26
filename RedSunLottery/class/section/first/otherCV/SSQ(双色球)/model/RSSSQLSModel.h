//
//  RSSSQLSModel.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/25.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSSQLSModel : NSObject

@property (nonatomic, copy) NSString *dxScale;//大小比

@property (nonatomic, copy) NSString *gc;//滚存

@property (nonatomic, copy) NSString *joScale;//奇偶比

@property (nonatomic, copy) NSString *kstatus;//开奖状态0-未开奖 1-已开奖

@property (nonatomic, copy) NSString *kcode;//开奖号

@property (nonatomic, copy) NSString *ktime;//开奖时间

@property (nonatomic, copy) NSString *lid;//彩种编号

@property (nonatomic, copy) NSString *lname;//彩种名称

@property (nonatomic, copy) NSString *pid;//期次号

@property (nonatomic, copy) NSString *pname;//期次名称

@property (nonatomic, copy) NSString *spid;//期次号

@end
