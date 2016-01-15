//
//  main.m
//  C07-指针
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Function.h"

int main(int argc, const char * argv[]) {
#pragma mark - 知识点1 c语言指针的概念
    /** 指针就是内存地址 通过指针一样可以访问内存的内容*/
#pragma mark - 知识点2 指针变量的定义和使用
    /** 定义一个指针变量 */
    /**
      指针变量p, 表示将访问一个地址之上4个字节的内容空间
      null 的含义是 将p 指向了0 * 0 地址 空指针*/
#if 0
   // int *p = NULL;
   // long *p2 = NULL;
#endif
    /** 指针变量 p 本身也需要在内存中保存 指针变量占用的内存字节数
         取决于系统 64位 占 8个字节 32位占4个字节*/
#pragma mark - 知识点3 指针的算术运算 &运算符 和 *运算符
#if 0
    /**  &符号的使用  作用 取出内存地址 简称 取址符  */
    int a = 100;
    int *p = NULL;  //定义个指针 指向空
    p = &a; /** 将指针p指向变量 a 的内存地址  */
    printf("p: %p \n",p);
    printf("a: %p \n",&a);
    printf("das");
    
    /** *符号: 取出指针指向的内存地址中的内容(取值符)  */
    
//    *p = 201;//相当于 a=201
    
    
//    printf("\n%d\n",*p);
//    int b = 200;
//    short *ps = &b;
//    printf("%hd",*ps);
    int c = 300;
    
    int *p3 = NULL;
    p = &c;
    p++;
    printf("\np = %p\n",p);
    printf("p++ = %p\n",++p);
    
    
    int num1 =  200, num2 = 300, temp = 0;
    int *p5 = NULL;
    int *p7 = NULL;
    int *p6 = NULL;
    p5 = &num1;
    p6 = &num2;
    p7 = &temp;
    
    
    temp = *p5;
    num1 = *p6;
    num2 = *p7;
    
    printf("\n%d%d\n",num1,num2);
    
    /**用函数 交换两个int 的值
     */
   
    
    int aa = 3 , b = 1;
    exchangNum(&aa, &b);
    printf("a = %d b = %d\n",aa,b);
#endif
#pragma mark - 知识点4 指针和数组的关系
#if 0
    int array[5] = {1,2,3,4,5};
    
    int *p = NULL;  //p + 1 访问后四个字节的内容
    int (*p2)[5] = NULL; // p + 1 访问后20个字节 相当于一个数组的长度
    p = array;
    printf("p: %p\n",p);   //
    printf("p: %p\n",array);//数组名
    printf("p: %p\n",&array);  //数组的首地址
    printf("p: %p\n",&array[0]);  //第一个元素的地址 首地址
    
    //结论数组名既是数组的首地址也是第一个元素的地址!!!
#endif
    
    
    
    /** 通过指针遍历数组  */
    
    
#if 0
    
    int array[5] = {32,4,23,6,3,};
    int *p = NULL;
    p = array;
    
    for (int i = 0;i < 5 ; i++) {  //首地址不变
        printf("%d\n",*(p + i));
    }
    
    
    for (int i = 0; i < 5; i++) { //首地址改变
        printf("%d\n",*(p++));
    }
    
    
    /** 扩展内容 */
    int * point[5]; //指针数组
    int (*point2)[5]; //数组指针
    
#endif
 
#if 0
    /** 用指针实现冒泡排序*/
    int array[5] = {32,4,23,6,3,};
    int *p = NULL;
    p = array;
    int temp = 0;
    for (int i = 0;  i < 5 - 1; i++) {
        for (int j = 0; j < 5 - 1 - i; j++) {
            if (*(p + j) > *(p + j + 1) ) {
                temp = *(p + j);
                *(p + j) = *(p +j +1);
                *(p+j+1) = temp;
            }
        }
    }
    for (int i = 0;i < 5 ; i++) {  //首地址不变
        printf("%d ",*(p + i));
    }
    printf("\n");
#endif
#if 0
    
    //指针作为函数的参数
    /**使用函数实现冒泡排序*/
    int array[5] = {32,4,23,6,3,};
    int *p = array;
    sortBub(p, 5);
    
    sortBub(array, 5); //数组名就是首地址
    
    
    
    
#endif
    
    
//    p = &array[0];
//    
//    int num = 0;
//    num = *(p+1);
//    printf("%d",num);
    
    
    
#pragma mark - 知识点5 指针和字符串的关系

    
    
    
    /** const 修饰词的作用    */
//    int a = 100;
//    a= 101;
//    const int b = 100;
//    b = 101; 经过const 修饰过的变量不能被修改 起到保护的作用
#if 0
    /*使用指针输出字符串*/
 char string[] ="iphone0";
    char *p = string; //指针指向字符串首地址
    int i= 0;
    while (*(p+ i) !='\0') {
        printf("%c",*(p+i));
               i++;
    }
    printf("\n");
    while (*p) {
        printf("%c",*(p++));
    }
    
    /* 使用指针输出字符串for*/
    char string2[] ="iphone0";
    char *p2 = string2;
    for (int i = 0; i < strlen(string2); i++) {
        printf("%c\n",*(p2 + i));
    }
#endif
    /**通过指针计算字符串的长度*/
    
    
    char string[] ="iphone";
    char *p = string; //指针指向字符串首地址
    int i= 0;
    while (*(p+ i) !='\0') {
      
        i++;
    }
    printf("%d",i);
    printf("\n");
    
    
    
    
    
    
    
    
    
    
    return 0;
}
