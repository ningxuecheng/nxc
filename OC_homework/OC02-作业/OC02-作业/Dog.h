//
//  Dog.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject


@property(nonatomic, retain)    NSString *name;
@property(nonatomic, retain)    NSString *color;
@property(nonatomic, assign)    NSInteger age;



-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                        age:(NSInteger)age;
+(instancetype)dogWithName:(NSString *)name
                     color:(NSString *)color
                       age:(NSInteger)age;
@end
