//
//  OurClass.h
//  oc08-lianxineicun
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Teacher;
@class Student;
@interface OurClass : NSObject
@property(nonatomic, copy)Teacher *tea;
@property(nonatomic, copy)NSMutableArray *stuArr;


- (void)addStu:(Student *)stu;
- (void)minStu:(Student *)stu;

@end
