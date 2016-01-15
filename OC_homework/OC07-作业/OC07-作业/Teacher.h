//
//  Teacher.h
//  OC07-作业
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"
@class OurClass;
@class Student;
@interface Teacher : Person

@property(nonatomic, retain)NSString *myclass;


- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                     myclass:(NSString *)myclass;


- (void)addValue:(NSMutableArray *)arr;

@end
