//
//  RSScoreHttpManager.m
//  RedSunLottery
//
//  Created by haozhong on 2017/12/2.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSScoreHttpManager.h"

#import "RSScorePeriod.h"
#import "RSMatchModel.h"

@interface RSScoreHttpManager ()

@property (nonatomic, strong) NSMutableArray *periodArr;

@end

@implementation RSScoreHttpManager

#pragma makr -- 返回正在比赛的数据

-(void)backModelScoreData{
    
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,@"/jsbf/jsbf_live.json"] params:nil cache:NO successBlock:^(id responseDict) {
        
        RSLog(@"%@",responseDict);
        
        
    } failBlock:^(NSError *error) {
        
        
    }];
    
}
-(void)getDataPeriod{
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,@"/jsbf/jsbf_period.json"] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        [responseDict enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            RSScorePeriod *model = [RSScorePeriod yy_modelWithJSON:obj];
            [self getDataMatch:model];
        }];
        
    } failBlock:^(NSError *error) {
        
    }];
}
- (void)getDataMatch:(RSScorePeriod *)model{
    
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,[NSString stringWithFormat:@"/jsbf/match/%@.json",model.period]] params:nil cache:NO successBlock:^(id responseDict) {
        
        RSLog(@"%@",responseDict);
        
        model.arrMatch = [NSArray yy_modelArrayWithClass:[RSMatchModel class] json:responseDict];
        
        [_periodArr addObject:model];
        
    } failBlock:^(NSError *error) {
        
        
    }];
    
}
#pragma mark - 创建单例
+ (RSScoreHttpManager *)sharedInstance{
    static RSScoreHttpManager *score;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        score = [[RSScoreHttpManager alloc] init];
        [score backModelScoreData];//开始请求及时比分的数据
    });
    return score;
}

@end
