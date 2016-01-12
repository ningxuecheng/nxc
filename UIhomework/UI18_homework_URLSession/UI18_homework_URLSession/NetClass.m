//
//  NetClass.m
//  UI18_homework_URLSession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "NetClass.h"

@implementation NetClass

- (void)passNet:(NSString *)net {
     NSLog(@"%s",__FUNCTION__);
        //URL
        NSURL *url = [NSURL URLWithString:net];
        
        //URLRequest (网络请求对象)
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        //session对象 （通道）
        NSURLSession *session = [NSURLSession sharedSession];
        
        //添加任务
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            //返回主线程
            dispatch_sync(dispatch_get_main_queue(), ^(){
                // 这里的代码会在主线程执行
                NSError *errorJSON = nil;
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorJSON];
                [self.delegate returnArr:result];
                 NSLog(@"%s",__FUNCTION__);
            });
            
        }];
    
        //开始任务
        [task resume];
    
}
@end
