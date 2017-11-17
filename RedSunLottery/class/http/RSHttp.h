//
//  RSHttp.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/12.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, NetworkStatus) {
    /** 未知网络*/
    NetworkStatusUnknown,
    /** 无网络*/
    NetworkStatusNotReachable,
    /** 手机网络*/
    NetworkStatusReachableViaWWAN,
    /** WIFI网络*/
    NetworkStatusReachableViaWiFi
};

/**  成功的回调 */
typedef void(^RequestSuccess)(id  responseDict);
/**  失败的回调 */
typedef void(^RequestFail)(NSError *error);
/**  请求完成的回调 */
typedef void(^RequestFinish)(NSError *error);
/**  请求任务 */
typedef NSURLSessionTask URLSessionTask;
/**   网络状态回调 */
typedef void(^RequestNetWorkStatus)(NetworkStatus status);

@interface RSHttp : NSObject

+(AFHTTPSessionManager *)shareManager;


+ (BOOL)checkData:(id)data;

+ (NetworkStatus)getNetworkStatus;

/**
 get请求
 
 @param url 路径
 @param params 参数
 @param cache 是否缓存
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
+ (URLSessionTask *)getRequestURL:(NSString *)url params:(NSDictionary *)params cache:(BOOL)cache  successBlock:(RequestSuccess)successBlock failBlock:(RequestFail)failBlock;




/**
 post请求
 
 @param url 路径
 @param params 参数
 @param cache 是否缓存
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
+(URLSessionTask*)postRequestURL:(NSString*)url
                          params:(NSDictionary*)params
                           cache:(BOOL)cache
                    successBlock:(RequestSuccess)successBlock
                       failBlock:(RequestFail)failBlock;






@end
