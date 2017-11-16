//
//  RSUserModel.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/15.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSUserModel : NSObject

@property (nonatomic, copy) NSString *avatar;//用户头像

@property (nonatomic, copy) NSString *balance;//用户余额

@property (nonatomic, copy) NSString *bankCard;//银行卡号(已隐藏中间段)

@property (nonatomic, copy) NSString *bankIsBind;//是否绑定银行卡

@property (nonatomic, copy) NSString *bankName;//银行名称

@property (nonatomic, copy) NSString *continuitySignDay;//连续签到天数

@property (nonatomic, copy) NSString *fansNum;//粉丝数

@property (nonatomic, copy) NSString *followNum;//关注数

@property (nonatomic, copy) NSString *idCard;//身份证号（已隐藏中间段）

@property (nonatomic, copy) NSString *idCardIsBind;//是否绑定身份证

@property (nonatomic, copy) NSString *isPasswordSafe;//是否密码保护

@property (nonatomic, copy) NSString *isSale;//是否是销售(0-普通用户 1-销售员 2-代理员)

@property (nonatomic, copy) NSString *isWhite;//是否开通白名单

@property (nonatomic, copy) NSString *key;//用户key

@property (nonatomic, copy) NSString *lastLoginIp;//上次登录ip

@property (nonatomic, copy) NSString *lastLoginTime;//上次登录时间

@property (nonatomic, copy) NSString *mobile;//手机号码

@property (nonatomic, copy) NSString *nickName;//昵称

@property (nonatomic, copy) NSString *realName;//真实姓名

@property (nonatomic, copy) NSString *score;//积分数

@property (nonatomic, copy) NSString *securityLevel;//用户安全级别(0,1,2,3个级别)

@property (nonatomic, copy) NSString *status;//用户状态(-1-注销 0-冻结 1-正常)

@property (nonatomic, copy) NSString *token;//用户token

@property (nonatomic, copy) NSString *updateUserNameNum;//当前昵称更新次数

@property (nonatomic, copy) NSString *vipLevel;//vip等级(1-普通 2-...待扩展)

@property (nonatomic, copy) NSString *withDraw;//可提现金额


@end
