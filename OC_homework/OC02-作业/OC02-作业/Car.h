//
//  Car.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property(nonatomic, retain)    NSString *name;
@property(nonatomic, retain)    NSString *color;
@property(nonatomic, retain)    NSString *type;



-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                       type:(NSString *)type;
+(instancetype)carWithName:(NSString *)name
                     color:(NSString *)color
                      type:(NSString *)type;
@end
