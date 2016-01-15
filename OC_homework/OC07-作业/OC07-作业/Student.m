//
//  Student.m
//  OC07-作业
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Student.h"

@implementation Student
- (NSComparisonResult)compareAge:(Student *)stu {

    if (self.age > stu.age) {
        return NSOrderedDescending;
    }if (self.age < stu.age) {
        return NSOrderedAscending;
    }else{
        return NSOrderedSame;
    }
}

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                      number:(NSString *)nsmber {

    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
        self.number = nsmber;
    }
    
    self.dicStudy = [NSMutableDictionary dictionary];

    return self;

}
@end
