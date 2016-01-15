//
//  Student.h
//  C09-函数指针
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Student {

    char name[20];
    int age ;
    float score;


} Student;

/** 声明函数 */

/** 拼接学生姓名的函数 */

Student chengName (Student stu);

/** 声明函数 查找学生函数 */
void selectStu(Student arr[], int count, Student (*P)(Student stu) );


/** 函数便利输出函数信息 */

void infoStu(Student arr[], int count);

/** 加分函数*/
Student chengScore (Student stu);




/** 函数 比较两个学生的姓名 */
BOOL cmpName (Student stu1, Student stu2);


/** 函数 比较两个学生的分数 */
BOOL cmpScore (Student stu1, Student stu2);

/** 函数 比叫两个学生的年龄 */
BOOL cmpAge (Student stu1, Student stu2);

/** 函数: 冒泡排序 (动态) */

void sortArrmy(Student arr[], int count, BOOL (*p)(Student, Student));















