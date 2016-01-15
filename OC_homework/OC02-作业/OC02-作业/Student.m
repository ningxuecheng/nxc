//
//  Student.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name
                         sex:(NSString *)sex
                         age:(NSInteger)age {


    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _sex = sex;
    }
    return self;

}
+(instancetype)studentWithName:(NSString *)name
                           sex:(NSString *)sex
                           age:(NSInteger)age {

    Student *stu1 = [[Student alloc] initWithName:name sex:sex age:age];
    return stu1;
}

@end
