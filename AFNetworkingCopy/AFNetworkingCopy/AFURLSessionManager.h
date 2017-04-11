//
//  AFURLSessionManager.h
//  AFNetworkingCopy
//
//  Created by zhangdong on 2017/4/7.
//  Copyright © 2017年 __Nature__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"

NS_ASSUME_NONNULL_BEGIN
@interface AFURLSessionManager : NSObject <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate, NSURLSessionDownloadDelegate, NSSecureCoding, NSCopying>

@property (readonly, nonatomic, strong) NSURLSession *session;

@property (readonly, nonatomic, strong) NSOperationQueue *operationQueue;

@property (nonatomic, strong) id <AFURLResponseSerialization> responseSerializer;

///--------------------------------
/// @name Getting Session Tasks
///--------------------------------

@property (readonly, nonatomic, strong) NSArray <NSURLSessionTask *> *tasks;

@property (readonly, nonatomic, strong) NSArray <NSURLSessionDataTask *> *dataTask;

@property (nonatomic, strong, nullable) dispatch_queue_t completionQueue;

@property (nonatomic, strong, nullable) dispatch_group_t completionGroup;

@property (nonatomic, assign) BOOL attemptsToRecreateUploadTasksForBackgroundSessions;


- (instancetype)initWtihSessionConfiguration:(nullable NSURLSessionConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                               uploadProgress:(nullable void (^)(NSProgress *uploadProgress))uploadProgressBlock
                             downloadProgress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                            completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
