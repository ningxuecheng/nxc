//
//  main.m
//  OC01-作业
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 1
//101010 0x2A
#pragma mark - 2
//214
#pragma mark - 3
//117 

int main(int argc, const char * argv[]) {
#pragma mark - 4
#if 0
    printf("%3c\n\n",'*');
    printf("%2c%2c\n\n",'*','*');
    printf("%c%2c%2c\n\n",'*','*','*');
#endif
#pragma mark - 5
#if 0
    double d = 0;
   
    printf("Enter an amount:");
    scanf("%lf", &d);
    printf("With tax added:$%.2lf\n",d + d * 0.05);
#endif
#pragma mark - 6
#if 0
    float a = 0,b = 0;
    printf("请输入两个数");
    scanf("%f%f",&a,&b);
    float c = a / b;
    printf("输出:%.2f%%",c * 100 );
    
    
#endif
#pragma mark - 7
#if 0
    int a = 0;
    printf("请输入一个数字: \n");
    scanf("%d",&a);
    int b = a / 20;
    printf("$20 bills: %d\n", b);
    a = a % 20 ;
    int c = a /10;
     printf("$10 bills: %d\n", c);
    a = a % 10;
    int d = a / 5;
     printf("$20 bills: %d\n", d);
    a = a % 5;
    int e = a / 1;
     printf("$20 bills: %d\n", e);
    
    
#endif
    
#pragma mark - 8
    
#if 0
    int a = 0,b = 0;
    printf("请输入两个正整数:\n");
    scanf("%d%d",&a,&b);
    printf("和%d\n", a + b);
    printf("差%d\n",a - b);
    printf("及%d\n", a * b);
    printf("于%d\n",a % b);
    
    
#endif
    
#pragma mark - 9
#if 0
    char a = '0';
    printf("请输入字符:");
    scanf("%c", &a);
    printf("%d\n",a);
    
    int b = 0;
    printf("请输入数字\n");
    scanf("%d",&b);
    printf("%c\n",b);
    
    
    
#endif
    

    
    return 0;
}
