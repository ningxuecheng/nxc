//
//  Person.h
//  OC06-遍历排序
//
//  Created by dllo on 15/12/8.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, retain)NSString *name;
@property(nonatomic, assign)NSInteger age;
@property(nonatomic, retain)NSString *sex;


- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                         sex:(NSString *)sex;

/** 声明一个按照姓名升序的方法. */
- (NSComparisonResult)compareWithNameUp:(Person *)anotherPerson;
/** 声明一个按照姓名降序的方法. */
- (NSComparisonResult)compareWithNameDown:(Person *)anotherPerson;

- (NSComparisonResult)compareWithAgeUp:(Person *)anotherPerson;











@end
