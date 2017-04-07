//
//  ZDNetworkManager.m
//  AFNetworkingCopy
//
//  Created by zhangdong on 2017/4/1.
//  Copyright © 2017年 __Nature__. All rights reserved.
//

#import "ZDNetworkManager.h"

@interface ZDNetworkManager ()<NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSURLSessionConfiguration *configuration;

@end

@implementation ZDNetworkManager
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static ZDNetworkManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [ZDNetworkManager new];
    });
    return instance;
}


- (NSURLSessionDataTask *)GET:(NSString *)UrlString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.operationQueue = [[NSOperationQueue alloc] init];
    self.operationQueue.maxConcurrentOperationCount = 1;
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:self.configuration delegate:self delegateQueue:nil];
    
    NSURL *url = [NSURL URLWithString:UrlString];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
////        NSLog(@"%@", data);
////        NSLog(@"%@", response);
//    }];
    
    // 使用代理的时候不需要使用
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    
    return dataTask;
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent
totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    NSLog(@"%lld", bytesSent);
}

#pragma mark - NSURLSessionDataDelegate
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    completionHandler(NSURLSessionResponseAllow);//允许处理服务器的响应，才会继续接收服务器返回的数据
    NSLog(@"%@", response);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {
    NSLog(@"%@-----", data);
    
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    // 请求完成,成功或者失败的处理
}
@end
