//
//  NetClass.h
//  UI18_homework_URLSession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetClassDelegate <NSObject>

- (void)returnArr:(id)result;

@end

@interface NetClass : NSObject
@property (nonatomic, assign) id<NetClassDelegate> delegate;



- (void)passNet:(NSString *)net;

@end
