//
//  Person.h
//  OC02-方法
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
    NSInteger _age;
    NSString *_sex;
}


/** 初始化方法 */

- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                         sex:(NSString *)sex;



/** 便利构造器方法(是类方法,类调用此方法) */

+ (instancetype)personWithName:(NSString *)name
                           sex:(NSString *)sex
                           age:(NSInteger)age;


+ (instancetype)person;








- (void)personInfo;

/** setter 方法: 目的,给一个实例变量赋值*/

- (void)setName:(NSString *)name;

/** getter 方法: 目的,去一个实例变量的值*/

- (NSString *)name;

- (void)setAge:(NSInteger)age;
- (NSInteger)age;

- (void)setSex:(NSString *)sex;
- (NSString *)sex;


-(void)studyPer;
@end
