//
//  Person.h
//  C06_2_结构体
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 定义一个person 结构体  */
struct Person {
    char name[20];
    int age;
    char sex;
    int number;
};
typedef struct Person Person;

/** 函数声明  */
void hello();
//显示个人信息的函数
void informationOfPerson(Person Per);
