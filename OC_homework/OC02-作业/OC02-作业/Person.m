//
//  Person.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithName:(NSString *)name
                        sex:(NSString *)sex
                        age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _age = age;
    }
    return self;
}

+(instancetype)personWithName:(NSString *)name
                          sex:(NSString *)sex
                          age:(NSInteger)age {


    Person *per = [[Person alloc] initWithName:name sex:sex age:age];
    return per;

}

@end
