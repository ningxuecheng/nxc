//
//  Person.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, retain)    NSString *name;
@property(nonatomic, retain)    NSString *sex;
@property(nonatomic, assign)    NSInteger age;





-(instancetype)initWithName:(NSString *)name
                        sex:(NSString *)sex
                        age:(NSInteger)age;

+(instancetype)personWithName:(NSString *)name
                          sex:(NSString *)sex
                          age:(NSInteger)age;


@end
