//
//  ZDNetworkManager.h
//  AFNetworkingCopy
//
//  Created by zhangdong on 2017/4/1.
//  Copyright © 2017年 __Nature__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDNetworkManager : NSObject

+ (instancetype)shareManager;

- (NSURLSessionDataTask *)GET:(NSString *)UrlString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;



@end
