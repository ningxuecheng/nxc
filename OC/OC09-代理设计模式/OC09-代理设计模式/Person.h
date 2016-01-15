//
//  Person.h
//  OC09-代理设计模式
//
//  Created by dllo on 15/12/11.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, retain)NSString *name;


- (instancetype)initWithName:(NSString *)name;

@end
