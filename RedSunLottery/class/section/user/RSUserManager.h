//
//  RSUserManager.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/15.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSUserModel.h"

@interface RSUserManager : NSObject
+ (instancetype)shareDataManager;

@property (nonatomic, strong)RSUserModel  *userModel;//个人信息

@property (nonatomic, strong) NSString *token;

@property (nonatomic, strong) NSString *key;

/// 判断是否登录
- (BOOL)isLogOn;
#pragma mark - public:进入app的时候获取个人信息
- (void)loadPersonInfo;
#pragma mark - pusblic:打开app的是进行token登录
- (void)logoToken;

#pragma mark - 登陆的时候保存个人信息
- (void)setAccountWithAccountInfo:(NSDictionary *)userModelInfo;
#pragma mark - 将token和key
- (void)saveKeyChainAccount:(NSString *)token password:(NSString *)key;
#pragma mark - 从keyChain 读取token
- (NSString *)getAccountFromKeyChain;
#pragma mark - 根据token获取key
- (NSString *)getUserKeyWith:(NSString *)token;

#pragma mark - 清除账户信息
- (void)clearAccount;

@end
