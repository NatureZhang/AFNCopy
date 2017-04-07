//
//  ViewController.m
//  AFNetworkingCopy
//
//  Created by zhangdong on 2017/4/1.
//  Copyright © 2017年 __Nature__. All rights reserved.
//

#import "ViewController.h"
#import "ZDNetworkManager.h"

//这篇写的不错 http://itangqi.me/2016/04/01/from-nsurlconnection-to-nsurlsession/

/*
 NSURLConnection vs NSURLSession
 1. 后台上传和下载：只需在创建NSURLSession的时候配置选项，就能得到后台网络的所有好处。这样可以延长电池寿命，并且还支持UIKit的多task，在进程间使用相同的委托模型
 2. 能够暂停和恢复网络操作：使用NSURLSession API能够暂停，停止，恢复所有的网络任务，再也完全不需要子类化NSOperation
 3. 可配置的容器：对于NSURLSession里面的requests来说，每个NSURLSession都是可配置的容器。eg：假如需要设置HTTP header 选项，只需配置一次，session里面的每个request就会有同样的配置
 4. 提高认证处理：认证是在一个指定的链接基础上完成的。在使用NSURLConnection时，如果发出一个访问，会返回一个任意的request，此时就不能确切的知道那个request收到了访问。而在NSURLSession中，就能用代理处理认证
 5. 丰富的代理模式：在处理认证的时候，NSURLConnection有一些基于异步的block方法，但是他的代理方法就不能处理认证，不管请求是成功或是失败。在NSURLSession中，可以混合使用代理和block方法处理认证
 6. 上传和下载通过文件系统：它鼓励将数据（文件内容）从元数据（URL 和 settings）中分离出来
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testGETNetwork:(id)sender {
    ZDNetworkManager *networkManager = [ZDNetworkManager shareManager];
    
    NSString *urlString = @"http://api.fir.im/apps?api_token=e951a2ea25b6e6fd29ec0c1844d12e8d";
    NSURLSessionDataTask *task = [networkManager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    [task resume];
}

@end
