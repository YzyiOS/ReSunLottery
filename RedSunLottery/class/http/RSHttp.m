//
//  RSHttp.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/12.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSHttp.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#define XD_ERROR [NSError errorWithDomain:@"HHHH" code:-999 userInfo:@{ NSLocalizedDescriptionKey:@"网络请求错误"}]


@implementation RSHttp


//static NSString *PCNetworkResultCode = @"code"; //responseCode
static NSTimeInterval requestTimeout = 10.f;    //超时时长
static NetworkStatus _netStatus;                //网络状态
static NSMutableArray *requestTasks;            //网络请求任务
static NSDictionary *headers;                   //http头部

static AFHTTPSessionManager *_manager;          //post-get Manager

#pragma mark - 初始化manager
+ (void)load{
    [self monitorNetwork];
}

/**
 初始化 json 解析manager 单利
 */
+(AFHTTPSessionManager *)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
        requestSerializer.stringEncoding = NSUTF8StringEncoding;
        requestSerializer.timeoutInterval = requestTimeout;
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
        responseSerializer.removesKeysWithNullValues = YES;
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                     @"text/html",
                                                     @"text/json",
                                                     @"text/plain",
                                                     @"text/javascript",
                                                     @"text/xml",
                                                     @"image/*",
                                                     @"application/octet-stream",
                                                     @"application/zip", nil];
        
        NSURL *baseUrl = [NSURL URLWithString:@"http://static.tuiqiuxiong.com"];
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
        _manager.requestSerializer = requestSerializer;
        _manager.responseSerializer = responseSerializer;
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        
        for (NSString *key in headers.allKeys) {
            if (headers[key] != nil) {
                [_manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
            }
        }
        
    });
    
    return _manager;
}
#pragma mark - 开始监听网络
+ (void)monitorNetwork
{
    void(^block)(AFNetworkReachabilityStatus status)  = ^(AFNetworkReachabilityStatus status) {
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                _netStatus = NetworkStatusUnknown;
                
                break;
            case AFNetworkReachabilityStatusNotReachable:
                _netStatus = NetworkStatusNotReachable;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                _netStatus = NetworkStatusReachableViaWWAN;
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                _netStatus = NetworkStatusReachableViaWiFi;
                
                break;
        }
    };
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:block];
    [manager startMonitoring];
    
}
#pragma mark 新get
+ (URLSessionTask *)getRequestURL:(NSString *)url params:(NSDictionary *)params cache:(BOOL)cache  successBlock:(RequestSuccess)successBlock failBlock:(RequestFail)failBlock {
    
    URLSessionTask *session = nil;
    AFHTTPSessionManager *manager = [self shareManager];

    if (_netStatus == NetworkStatusNotReachable) {
        if (failBlock) {
            failBlock(XD_ERROR);
        }
        [RSProgressHUd showErrorWithText:@"网络未连接"];
        return session;
    }

    [manager GET:url parameters:params progress:^(NSProgress *  downloadProgress) {
//        if(progressBlock){
//            progressBlock(downloadProgress);
//        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        RSLog(@"\n>>>\n地址:\n     %@\n返回的数据:%@\n<<<",url,[responseObject description]);

        NSDictionary *data = (NSDictionary*)responseObject;
        
            successBlock(data);
        
        //移除任务
        [[self allTasks] removeObject:session];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock(error);
        [[self allTasks] removeObject:session];
    }];
    if (session)
    {
        [[self allTasks] addObject:session];
    }
    return session;
}
#pragma mark 新的post
+ (URLSessionTask*)postRequestURL:(NSString *)url params:(NSMutableDictionary *)params cache:(BOOL)cache  successBlock:(RequestSuccess)successBlock failBlock:(RequestFail)failBlock {
    URLSessionTask *session = nil;
    AFHTTPSessionManager *manager = [self shareManager];
    if (_netStatus == NetworkStatusNotReachable) {
        if (failBlock) {
            failBlock(XD_ERROR);
        }
        [RSProgressHUd showErrorWithText:@"网络未连接"];
        return session;
    }
    if ([url containsString:@"/user/"]) {
        [params setObject:[RSTools dicToMD5:params] forKey:@"sign"];
    }
    
    RSLog(@"parameters:%@",params);
    [manager POST:[NSString stringWithFormat:@"%@",url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        if (progressBlock) {
//            progressBlock(uploadProgress);
//        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       RSLog(@"\n>>>\n地址:\n     %@\n返回的数据:%@\n<<<",url,[responseObject description]);
                [RSProgressHUd dismiss];
            NSDictionary *data = (NSDictionary*)responseObject;
        if ([data[@"errorCode"] integerValue] == 200) {//请求成功
            successBlock(data);
        }else{
            failBlock([NSError errorWithDomain:url code:[data[@"errorCode"] integerValue] userInfo:@{ NSLocalizedDescriptionKey:data[@"errorDesc"]}]);
        }
        
     
        [[self allTasks] removeObject:session];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock(error);
        [[self allTasks] removeObject:session];
    }];
    if (session)
    {
        [[self allTasks] addObject:session];
    }
    return session;
}


+ (NetworkStatus)getNetworkStatus{
    return _netStatus;
}
#pragma mark - Private Function

+ (NSMutableArray *)allTasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (requestTasks == nil) requestTasks = [NSMutableArray array];
    });
    
    return requestTasks;
}
+ (void)configHttpHeader:(NSDictionary *)httpHeader {
    headers = httpHeader;
}


@end
