//
//  NetworkingHandler.h
//  UI29_Block
//
//  Created by dllo on 16/1/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkingHandler : NSObject



+ (void)netWorkingWithURL:(NSString *)string completeHandle:(void (^)(NSURLResponse* response,NSData *data, id result))block;



@end
