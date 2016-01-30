//
//  NetworkingHandler.m
//  UI29_Block
//
//  Created by dllo on 16/1/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "NetworkingHandler.h"

@implementation NetworkingHandler

+ (void)netWorkingWithURL:(NSString *)string completeHandle:(void (^)(NSURLResponse *, NSData *, id))block {

    NSString *strTemp = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:strTemp];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    //add task
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                //直接调用block
                block(response,data,result);
                
            });
            
        }
        
        
    }];
    [task resume];






}



@end
