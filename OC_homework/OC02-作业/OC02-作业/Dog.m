//
//  Dog.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                        age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _color = color;
    }
    return self;
}
+(instancetype)dogWithName:(NSString *)name
                     color:(NSString *)color
                       age:(NSInteger)age {

    Dog *dog1 = [[Dog alloc] initWithName:name color:color age:age];
    return dog1;


}
@end
