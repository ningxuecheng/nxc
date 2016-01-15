//
//  Person.h
//  OC03-属性
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

//声明属性

/**
@property NSString *name;
@property NSInteger age;
@property NSString *sex;
 */



/** 属性的特性 */

@property(readwrite) NSString *name;
/** readwrite 可读性特性 有四个选项: readonly, readwrite, setter=,
    getter= 默认是readwrite
 */


@property(readwrite, nonatomic)NSInteger age;
/** nonatomic 原子性特性 有2个选项 atomic(原子性),nonatomic(费原子性)
    atomic 保证在多线程下的绝对安全,但占用系统资源,通常使用nonatomic即可,
    默认是 atomic 
 */
@property (readwrite, nonatomic, retain)NSString *sex;
/** retain 语义设置  assign retain copy 不同的语义选项,setter 和 getter 方法实现 不同, 使用规则是 费对象类型 (int float)使用 assign, 对象类型的,使用 retain 
    对象类型 同时想得到副本 使用 copy*/

@property (nonatomic, assign)float weight;


@property (nonatomic, retain)NSString *hobby;

@end
