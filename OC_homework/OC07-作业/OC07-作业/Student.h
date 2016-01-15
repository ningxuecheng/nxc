//
//  Student.h
//  OC07-作业
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property(nonatomic, retain)NSString *number;
@property(nonatomic, retain)NSMutableDictionary *dicStudy;


- (NSComparisonResult)compareAge:(Student *)stu;

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                      number:(NSString *)nsmber;

@end
