//
//  Cat.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Cat.h"

@implementation Cat
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
+(instancetype)catWithName:(NSString *)name
                     color:(NSString *)color
                       age:(NSInteger)age {

    
    Cat *cat1 = [[Cat alloc] initWithName:name color:color age:age];
    return cat1;

}
@end
