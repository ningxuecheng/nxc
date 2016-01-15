//
//  Person.h
//  OC06-作业
//
//  Created by dllo on 15/12/8.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *sex;
@property(nonatomic, assign)NSInteger age;

- (instancetype)initWithName:(NSString *)name
                         sex:(NSString *)sex
                         age:(NSInteger)age;


- (NSComparisonResult)compareWithName:(Person *)another;
- (NSComparisonResult)compareWithAge:(Person *)another;
- (Person *)maxAge:(Person *)another;
@end
