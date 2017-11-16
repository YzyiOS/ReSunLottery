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

/// 判断是否登录
- (BOOL)isLogOn;
#pragma mark - public:进入app的时候获取个人信息
- (void)loadPersonInfo;
#pragma mark - 登陆的时候保存个人信息
- (void)setAccountWithAccountInfo:(NSDictionary *)userModelInfo;


@end
