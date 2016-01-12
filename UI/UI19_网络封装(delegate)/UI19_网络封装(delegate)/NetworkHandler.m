//
//  NetworkHandler.m
//  UI19_网络封装(delegate)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "NetworkHandler.h"

@implementation NetworkHandler

//通过NSURLSession类实现网络请求
- (void)networkHandlerJSONWithURL:(NSString *)string {

    //将字符串进行转码(URL中不能含有中文等字符)
    NSString *strTemp = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //url
    NSURL *url = [NSURL URLWithString:strTemp];
    
    NSLog(@"%@",strTemp);
    //session
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    //add task
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSError *err = nil;
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
            
            if ([self.delegate respondsToSelector:@selector(handleDidComplete:)]) {
                [self.delegate handleDidComplete:result];
            }
        });
        
        
        
        
    }];
    
    
    



    [task resume];



}

+ (void)HandlerJSONWithURL:(NSString *)urlstring delegate:(id<NetworkHandlerDelegate>)delegate {

    NetworkHandler *handler = [[NetworkHandler alloc] init];

    handler.delegate = delegate;
    [handler networkHandlerJSONWithURL:urlstring];




}
@end
