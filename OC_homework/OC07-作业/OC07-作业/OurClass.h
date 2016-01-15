//
//  OurClass.h
//  OC07-作业
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Teacher;
@class Student;
@interface OurClass : NSObject
@property(nonatomic, retain)Teacher *tea;
@property(nonatomic, retain)NSMutableArray *stuArr;


- (void)addStu:(Student *)stu;
- (void)minStu:(Student *)stu;

@end
