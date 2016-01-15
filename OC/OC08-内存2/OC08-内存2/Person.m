//
//  Person.m
//  OC08-内存2
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)dealloc {
    [_name release];
    [_sex release];
    [super dealloc];

}
/** 实现协议方法 (NSCoping协议方法)*/
- (id)copyWithZone:(NSZone *)zone {

    Person *per = [[Person allocWithZone:zone] init];
    per.name = self.name;
    per.age = self.age;
    per.sex = self.sex;
    
    
    
    return per;
}



@end
