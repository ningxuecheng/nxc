//
//  MyFunction.m
//  C05-作业-44-宁学成
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "MyFunction.h"
#import <math.h>

//1. 1. 用函数实现 : 随机产生20个[10 , 100]的正整数,输出这些 数以及他们中的最大数
//2.//2. 用函数实现 : 编程将所有“水仙花数”打印出来,并打印 其总个数。 “水仙花数”是一个各个位立方之和等于该整 数的三位数
//3.用函数实现 : 已知abc+cba = 1333,其中a,b,c均为一位 数,编程求出满足条件的a,b,c所有组合
//4.4. 用函数实现:输入一个数,判断符号.如果大于0,输出“正 数”;如果小于0,输出“负数”;如果等于0,输出“0”
//5.用函数实现 : 输入一个整数,判断奇偶,并返回 判断结果(BOOL)
void maxArray(){
    int array[20] = {},max = 0;
    for (int i = 0; i < 20; i++) {
        array[i] = arc4random() % (100 - 10 + 1) + 10;
        printf(" %d",array[i]);
        max = max > array[i] ? max : array[i];
   }
    
    
    printf("\n");
    printf(" max: %d",max);
    printf("\n");
}
void flowerNum(){
    
    int  i = 100, a = 0, b = 0, c = 0, count = 0;
    for ( i = 100;i < 1000 ;i++) {
        a = i / 10 / 10; //百位
        b = (i /10) % 10; //十位
        c =  i % 10 ;//个位
        if (i == a*a*a + b*b*b + c*c*c) {
            count++;
        }
    }
    printf("\n");
    printf("%d",count);
    printf("\n");

}
void dengNum(){
   printf("abc + cba\n");
    for (int i = 0 ; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            for (int k = 0; k < 10; k++) {
                if (1333 == i*100+j*10+k +k*100+j*10+i) {
                    
                    printf("%d%d%d + %d%d%d\n",i,j,k,k,j,i);
                }
            }
        }
    }

}

void zhengNum(){
    float a = 0;
    printf("请输入一个数:\n");
    scanf("%f",&a);
    if (a > 0) {
        printf("正数");
    }else if (a < 0){
    
        printf("负数");
    }else {
        printf("0");
      
    }

}
BOOL joNum(int x){
    if (x % 2 == 0) {
        
        return YES;
    }else{
    
        return NO;
    }

}
float derTa(int a, int b, int c){
    
    return (b * b - 4 * a * c) * 1.0;

}
void jieNum(int a, int b, int c){
    int k = derTa(a, b, c);
    float num1 = 0, num2 = 0;
    if (k > 0) {
        num1 = (-b - sqrt(k)) / 2 * a;
        num2 = (-b + sqrt(k)) / 2 * a;
        printf("\n");
        printf("x1 = %f\n",num1);
        printf("x2 = %f\n",num2);
        printf("\n");
    }else if (k == 0){
        num1 = -(b / 2 * a);
        printf("x1 = x2 = %f\n",num1);
    
    }else{
        printf("无解\n");
    
    }

}






