//
//  Person.m
//  OC06-遍历排序
//
//  Created by dllo on 15/12/8.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                         sex:(NSString *)sex {

    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _age = age;
    }

    return self;
}

- (NSComparisonResult)compareWithNameUp:(Person *)anotherPerson {

  return [self.name compare:anotherPerson.name];
}

/** 声明一个按照姓名降序的方法. */
- (NSComparisonResult)compareWithNameDown:(Person *)anotherPerson {

    return -[self.name compare:anotherPerson.name];
}

- (NSComparisonResult)compareWithAgeUp:(Person *)anotherPerson {
    if (self.age > anotherPerson.age ) {
        return NSOrderedDescending;
    }else if (self.age < anotherPerson.age) {
        return NSOrderedAscending;
    }else{
        return NSOrderedSame;
    }
}

@end
