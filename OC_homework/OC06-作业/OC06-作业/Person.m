//
//  Person.m
//  OC06-作业
//
//  Created by dllo on 15/12/8.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
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
- (NSComparisonResult)compareWithName:(Person *)another {


    return [self.name compare:another.name];
 }
- (NSComparisonResult)compareWithAge:(Person *)another {
    if (self.age > another.age) {
        return NSOrderedAscending;
    }else if (self.age < another.age)
    {
        return  NSOrderedDescending;
    }else{
        return NSOrderedSame;
    }
}
- (Person *)maxAge:(Person *)another {
    if (self.age > another.age) {
        return self;
    }else{
    
        return another;
    }
  

}

@end
