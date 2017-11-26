//
//  periodTitleModel.m
//  RedSunLottery
//
//  Created by Marjoice on 17/11/2017.
//  Copyright © 2017 RedSun. All rights reserved.
//

#import "periodTitleModel.h"

@interface periodTitleModel ()<YYModel>

@end

@implementation periodTitleModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    
    return @{
             @"bf"             :   @"bf",
             @"gname"             :   @"gname",
             @"hname"             :   @"hname",
             @"kcode"             :   @"kcode",
             @"ktime"             :   @"ktime",
             @"lid"             :   @"lid",
             @"lname"             :   @"lname",
             @"pid"             :   @"pid",
             @"pname"             :   @"pname",
             };
}


@end
