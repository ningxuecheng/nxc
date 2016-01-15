//
//  Teacher.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

@property(nonatomic, retain)    NSString *name;
@property(nonatomic, retain)    NSString *sex;
@property(nonatomic, retain)    NSString *teach;


- (instancetype)initWithName:(NSString *)name
                         sex:(NSString *)sex
                       teach:(NSString *)teach;

+(instancetype)teacherWithName:(NSString *)name
                           sex:(NSString *)sex
                         teach:(NSString *)teach;
@end
