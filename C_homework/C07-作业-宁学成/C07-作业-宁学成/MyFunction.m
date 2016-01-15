//
//  MyFunction.m
//  C07-作业-宁学成
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "MyFunction.h"
//1. 输入10个整数，将其中最小的数与第一个数对换，把最大的数和最后一个数对换，指针实现
void exchangeNum(int *p,int n) {
    int max = 0;
    int min = 0;
    for (int i = 0; i < n - 1 ; i++) {
        if (*(p + i) > *(p + 9)) {
            max = *(p + i);
            *(p + i) = *(p + 9);
            *(p + 9) = max;
        }
        if (*(p + i) < *p ) {
            min = *(p +i);
            *(p+i) = *p;
            *p = min;
        }
    }
    for (int i = 0; i < n ; i++) {
        printf("%d ",*(p + i));
    }
    printf("\n");
}
void noNum(char *array) {
    int i = 0;
    int j = 0;
    while (*(array + i) != '\0') {
        if (*(array + i) < '0' || *(array + i) > '9' ) {
            *(array + j) = *(array + i);
            j++;
        }
        i++;
    }
    *(array + j) = '\0';
    int b = 0;
    while (*(array + b) != '\0') {
       
        printf("%c",*(array + b));
        b++;
    }
}
//3. 练习使用指针和地址传递，编写函数swap交换两个浮点数，main函数中实现以下功能：
//1）由用户输入3个数x、y、z的值；  5    4    2
//2）调用函数swap交换3个数中的最大数和最小数；
//3）输出交换后3个数的值。 2 5 4

void changeNum(float *a, float *b, float *c ) {
    float *max = NULL;
    float *min = NULL;
    
    max = *a > *b ? a : b;
    max = *max > *c ? max : c;
    
    min = *a < *b ? a : b;
    min = *min < *c ? min : c;
    float temp = 0 ;
    temp = *max;
    *max = *min;
    *min = temp;
    
    
    printf("%.2f \n%.2f \n%.2f\n",*a,*b,*c);
    

}














