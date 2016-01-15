//
//  MyFunction.h
//  C09-作业-宁学成
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

//    作业: 1.随机生成一个 10 个元素的数组,找到 3 的倍数,并将其值修改成 0.(注意:修改数值使用回调函数处理)
//声明函数

void changNum(int *arr,int count , int *(arrp)(int *array));

int *arr(int *array);


void printArry(int *arr,int count);
//作业: 2. 有两个10个元素的数组,分别为A和B,编程实现相同位置的元素, 如果 B 的元素小于 A 的元素进行数值交换:(使用回调函数实现)

void exchangeTwo(int *array1, int *array2);


void exchNum(int *arr1,int *arr2,int count,void (*p)(int *array1,int *array2));