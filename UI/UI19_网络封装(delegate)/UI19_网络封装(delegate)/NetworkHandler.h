//
//  NetworkHandler.h
//  UI19_网络封装(delegate)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol NetworkHandlerDelegate <NSObject>

- (void)handleDidComplete:(id)result;

@end

@interface NetworkHandler : NSObject

@property (nonatomic, assign) id<NetworkHandlerDelegate> delegate;

- (void)networkHandlerJSONWithURL:(NSString *)string;

+ (void)HandlerJSONWithURL:(NSString *)urlstring delegate:(id<NetworkHandlerDelegate>)delegate;

@end
