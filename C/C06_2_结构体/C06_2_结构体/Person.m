//
//  Person.m
//  C06_2_结构体
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"


/** 函数的实现部分  */
void hello() {

    printf("hello word! \n");
}
//显示个人信息的函数
void informationOfPerson(Person Per) {
   
    printf("name = %s,age = %d,sex = %c,number = %d\n",Per.name,Per.age,Per.sex,Per.number);

}








