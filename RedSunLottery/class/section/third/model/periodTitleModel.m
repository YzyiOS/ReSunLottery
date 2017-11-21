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
             @"lname"             :   @"lname",
             @"ktime"             :   @"ktime",
             @"pname"             :   @"pname",
             @"kcode"             :   @"kcode",
             };
}


@end
