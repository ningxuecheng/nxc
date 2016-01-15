//
//  Teacher.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (instancetype)initWithName:(NSString *)name
                         sex:(NSString *)sex
                       teach:(NSString *)teach {

    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _teach =teach;
    }
    return self;
}

+(instancetype)teacherWithName:(NSString *)name
                           sex:(NSString *)sex
                         teach:(NSString *)teach {

    Teacher *tea1 = [[Teacher alloc] initWithName:name sex:sex teach:teach];
    return tea1;

}


@end
