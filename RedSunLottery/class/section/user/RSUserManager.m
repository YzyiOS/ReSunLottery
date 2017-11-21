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
- (void)logoToken{
    if (![[self getAccountFromKeyChain] isEqualToString:@""] && [self getAccountFromKeyChain]) {
        NSMutableDictionary *paramer = [[NSMutableDictionary alloc] initWithCapacity:0];
        [paramer setObject:APPID forKey:@"appId"];
        [paramer setObject:UUIDStr forKey:@"device"];
        [paramer setObject:@"www" forKey:@"marketForm"];
        [paramer setObject:@"1" forKey:@"loginType"];
        [paramer setObject:[self getUserKeyWith:[self getAccountFromKeyChain]] forKey:@"key"];
        [paramer setObject:[self getAccountFromKeyChain] forKey:@"token"];

        
        [RSHttp postRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseMobileUrl,@"/api/user/login"] params:paramer cache:NO successBlock:^(id responseDict) {
            RSLog(@"%@",responseDict);
            
            //更新数据
            [RSUserManager shareDataManager].userModel = [RSUserModel yy_modelWithJSON:responseDict[@"data"]];
            
            [[RSUserManager shareDataManager] setAccountWithAccountInfo:responseDict[@"data"]];
            
        } failBlock:^(NSError *error) {
            [self clearAccount];//请求失败则清除用户所有信息
        }];
        
    }
    
}
#pragma mark --- 判断是否需要登录
- (BOOL)isLogOn{
    return (![[self getAccountFromKeyChain] isEqualToString:@""] && [self getAccountFromKeyChain])? YES:NO;
}
#pragma mark - 登陆的时候保存个人信息
- (void)setAccountWithAccountInfo:(NSDictionary *)userModelInfo{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *accountData = [NSKeyedArchiver archivedDataWithRootObject:userModelInfo];
        [[NSUserDefaults standardUserDefaults] setObject:accountData forKey:RSAccountKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });
}
#pragma mark - 将token和key
- (void)saveKeyChainAccount:(NSString *)token password:(NSString *)key{
    NSError *error;
    [SSKeychain setPassword:key forService:[UIApplication sharedApplication].appBundleID account:token error:&error];
    if (error) {
        NSLog(@"密码保存失败");
    }
    
}
#pragma mark - 从keyChain 读取token
- (NSString *)getAccountFromKeyChain{
    NSString *service = [UIApplication sharedApplication].appBundleID;
    NSDictionary *accountDict = [SSKeychain accountsForService:service].lastObject;
    return accountDict[kSSKeychainAccountKey];
    
}
#pragma mark - 根据token获取key
- (NSString *)getUserKeyWith:(NSString *)token{
    NSString *service = [UIApplication sharedApplication].appBundleID;
    return [SSKeychain passwordForService:service account:token];
    
}
#pragma mark - 清除账户信息
- (void)clearAccount{
    [self saveKeyChainAccount:nil password:nil];//这里把token和key都清空
    self.userModel = nil;//用户信息也清空.
    
}
@end
