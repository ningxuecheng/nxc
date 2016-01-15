//
//  Person.h
//  OC07-内存管理
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, retain)NSString *name;
@property(nonatomic, assign)NSInteger age;
@property(nonatomic, retain)NSString *sex;



- (instancetype)initWithName:(NSString *)name;

+(instancetype)person;


@end
