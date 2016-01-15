//
//  Student.m
//  C09-函数指针
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Student.h"

/** 拼接学生姓名的函数 */

Student chengName (Student stu) {
    
    
    strcat(stu.name, "高富帅");
    return stu;
}


/** 加分函数*/
Student chengScore (Student stu) {
    
    stu.score = stu.score + 5;
    return stu;
}

/** 声明函数 查找学生函数 */
void selectStu(Student arr[], int count, Student (*p)(Student stu)) {
    
    for (int i = 0; i < count  ; i++) {
        if (arr[i].score > 90) {
            arr[i] = p(arr[i]);
        }
       
    }
}
/** 函数便利输出函数信息 */

void infoStu(Student arr[], int count) {

    for (int i = 0; i < count ; i++) {
        printf("name:%s,age:%d,score:%.2f\n",arr[i].name,arr[i].age,arr[i].score);
    }

}







/** 函数 比较两个学生的姓名(升序) */
BOOL cmpName (Student stu1, Student stu2) {

    return  strcmp(stu1.name, stu2.name) > 0 ;
}

/** 函数 比较两个学生的分数 */
BOOL cmpScore (Student stu1, Student stu2) {
    
    return  stu1.score > stu2.score;
}

/** 函数 比叫两个学生的年龄 */
BOOL cmpAge (Student stu1, Student stu2) {

    return stu1.age > stu2.age;

}
/** 函数: 冒泡排序 (动态) */

void sortArrmy(Student arr[], int count, BOOL (*p)(Student, Student)) {
    Student temp = {};
    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - 1 - i ; j++) {
            /** 重点是判断条件 通过函数回调,函数的返回值做判断的条件,即函数的返回值
                 为bool */
            if (p(arr[j],arr[j + 1])) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

















