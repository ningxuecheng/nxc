//
//  MyFunction.h
//  C07-作业-宁学成
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

 //1. 输入10个整数，将其中最小的数与第一个数对换，把最大的数和最后一个数对换，指针实现

void exchangeNum(int *p,int n);

//2. 有一字符串，包含数字与字母，编程去除数字。
//1、要求在原字符串中操作
//2、使用指针处理。

void noNum(char *array);


//3. 练习使用指针和地址传递，编写函数swap交换两个浮点数，main函数中实现以下功能：
//1）由用户输入3个数x、y、z的值；  5    4    2
//2）调用函数swap交换3个数中的最大数和最小数；
//3）输出交换后3个数的值。 2 5 4

void changeNum(float *a, float *b, float *c );





















