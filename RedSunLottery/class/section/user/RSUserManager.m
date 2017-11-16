//
//  RSUserManager.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/15.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSUserManager.h"
static NSString *RSAccountKey = @"RSAccountKey";

@implementation RSUserManager
static RSUserManager *instance;
+ (instancetype)shareDataManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (RSUserModel *)userModel{
    if (!_userModel) {
        _userModel = [RSUserModel new];
    }
    return _userModel;
}
#pragma mark - public:进入app的时候获取个人信息，要是没有说明没有登陆，点击我的时候就要跳到登陆界面
- (void)loadPersonInfo{
    NSData *data = [kUserDefaults objectForKey:RSAccountKey];
    
    
    if (data)
    {
        NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        RSUserModel *account = [RSUserModel yy_modelWithJSON:dic];
        _userModel = account;
    }
    if ([self isLogOn])
    {
        //这里要去刷新一下个人信息
//        [self loadUserInfo:nil];
    }
}
#pragma mark --- 判断是否需要登录
- (BOOL)isLogOn{
    return (self.userModel.token && ![self.userModel.token isEqualToString:@""])? YES:NO;
}
#pragma mark - 登陆的时候保存个人信息
- (void)setAccountWithAccountInfo:(NSDictionary *)userModelInfo{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *accountData = [NSKeyedArchiver archivedDataWithRootObject:userModelInfo];
        [[NSUserDefaults standardUserDefaults] setObject:accountData forKey:RSAccountKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });
}
@end
