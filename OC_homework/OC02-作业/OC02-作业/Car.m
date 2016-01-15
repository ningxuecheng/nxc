//
//  Car.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Car.h"

@implementation Car
-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                       type:(NSString *)type {
    self = [super init];
    if (self) {
        _name = name;
        _color = color;
        _type = type;
    }
    return self;

}
+(instancetype)carWithName:(NSString *)name
                     color:(NSString *)color
                      type:(NSString *)type {
   
    Car *car1 = [[Car alloc] initWithName:name color:color type:type];
    return car1;
}

@end
