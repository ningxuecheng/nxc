//
//  MyFunction.m
//  C09-作业-宁学成
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "MyFunction.h"

//    作业: 1.随机生成一个 10 个元素的数组,找到 3 的倍数,并将其值修改成 0.(注意:修改数值使用回调函数处理)
//声明函数
int *arr(int *array) {
        *array = 0;
    return array;
}

void changNum(int *arr,int count , int *(arrp)(int *array)) {
    for (int i = 0;  i < count; i++) {
        if (*(arr + i) % 3 == 0) {
            arrp(arr + i);
        }
    }
}

void printArry(int *arr,int count) {
    for (int i = 0; i < count; i++) {
        printf(" %2d",*(arr + i));
    }
    printf("\n");
}

//作业: 2. 有两个10个元素的数组,分别为A和B,编程实现相同位置的元素, 如果 B 的元素小于 A 的元素进行数值交换:(使用回调函数实现)

void exchangeTwo(int *array1, int *array2) {
    int temp = 0;
    temp = *array2;
    *array2 = *array1;
    *array1 = temp;
 }


void exchNum(int *arr1,int *arr2,int count,void (*p)(int *array1,int *array2)) {
    for (int i = 0; i < count ; i++) {
        if (*(arr1 + i) > *(arr2 + i)) {
            p(arr1 + i, arr2 + i);
        }
    }
}















