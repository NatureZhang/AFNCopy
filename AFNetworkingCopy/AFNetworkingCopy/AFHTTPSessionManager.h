//
//  AFHTTPSessionManager.h
//  AFNetworkingCopy
//
//  Created by zhangdong on 2017/4/7.
//  Copyright © 2017年 __Nature__. All rights reserved.
//

#import "AFURLSessionManager.h"

NS_ASSUME_NONNULL_BEGIN  //包在里面的对象，默认加nonnull对象
@interface AFHTTPSessionManager : AFURLSessionManager

@property (readonly, nonatomic, strong, nullable) NSURL *baseURL;

@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> *requestSerializer;

@property (nonatomic, strong) AFHTTPResponseSerializer <AFURLResponseSerialization> * responseSerializer;

+ (instancetype)manager;

- (instancetype)initWithBaseURL:(nullable NSURL *)url;

- (instancetype)initWithBaseURL:(nullable NSURL *)url
           sessionConfiguration:(nullable NSURLSessionConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

- (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
@end
NS_ASSUME_NONNULL_END
