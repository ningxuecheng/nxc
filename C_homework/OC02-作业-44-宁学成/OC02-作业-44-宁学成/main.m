//
//  main.m
//  OC02-作业-44-宁学成
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
#pragma mark - 1
#if 0
/**1.输入一个整数，判断奇偶，并输出“某某是奇数”或者“某某是偶数”*/
    {
        int num = 0,a = 0;
        printf("请输入一个整数:\n");
        scanf("%d",&num);
        a = num % 2;
        if (0 == a) {
            printf("%d 是偶数 \n",num);
        }else {
            printf("%d 是奇数 \n",num);
        }
       
    }
#endif
#pragma mark - 2
#if 0
    /**输入一个数，判断符号。如果大于0，输出“正数”；如果小于0，输出“负数”；如果等于0，输出“0”。*/
    {
        float num = 0;
        printf("请输入一个数字:\n");
        scanf("%f",&num);
        if (num > 0) {
            printf("正数");
        }else if (num < 0){
            printf("负数");
        
        }else{
            printf("0");
        }
    
      
    }
#endif
#pragma mark - 3
#if 0
    /**编程判断3人中谁的年龄最大，并打印最大者的年龄。*/
    {
        int year1 = 0, year2 = 0, year3 = 0, max = 0;
        printf("请输入3人的年龄:\n1");
        scanf("%d%d%d",&year1,&year2,&year3);
        max = year1 > year2 ? year1 : year2;
        max = max > year3 ? max : year3;
        printf("最大的年龄是:%d \n",max);
        
      
    
    }
#endif
#pragma mark - 4
#if 0
    /**铁路托运行李规定：行李重不超过50公斤的，托运费按0.15元每公斤计算，如果超过50公斤，超出部分每公斤加收0.1元。编程实现上述功能。*/
    {
        int kg = 0;
        float price = 0;
        printf("请输入公斤数: \n");
        scanf("%d",&kg);
        if (kg / 50 <= 1) {
            price = kg * 0.15;
            printf("托运费为: %f \n",price);
        }else {
            kg = kg - 50;
            price = kg * 0.25 + 50 * 0.15;
            printf("托运费为: %f \n",price);
        
        }
        
        
    
    }
#endif
#pragma mark - 5
#if 0
    /**有一个函数：x<1的时候，y = x；1<=x<10的时候，y=2x-1；x>=10的时候，y=3x-11。写一段程序，输入x，输出y值。*/
    {
        float x = 0,y = 0;
        printf("请输入 x 的值:");
        scanf("%f",&x);
        if (x < 1) {
            y = x;
            printf("输出y = %f",y);
        }else if (x < 10 && x >= 1 ){
            y = 2 * x - 1;
            printf("输出y = %f",y);
        }else{
            y = 3 * x - 11;
            printf("输出y = %f",y);
        }
        
    }
#endif
#pragma mark - 6
#if 0
    /**编写一个完成两个数四则运算的程序。如：用户输入34+56则输出结果为90.00，要求运算结果保留2位有效小数，用户输入时将2个运算数以及运算符都输入，根据运算符求结果。*/
    {
        int a = 0 , b = 0;
        char c = 0;
        printf("输入形如(11+11):");
        scanf("%d%c%d",&a,&c,&b);  //形如这种输入是不用回车的!!!
        if ('+' == c) {
            
            a = a + b;
            printf("a + b = %d",a);
        }
        if('-' == c){
            a = a - b;
            printf("a - b = %d",a);
        }
        if('*' == c){
            a = a * b;
            printf("a * b = %d",a);
        }
        if('/' == c && b != 0){
            a = a / b;
            printf("a / b = %d",a);
        }
        else{
            printf("除数不能为0!");
        
        }
        
    
    }
#endif
#pragma mark - 7
#if 0
    /**输入3个数，判断是否能构成三角形。*/
    {
        float n1 = 0,n2 = 0,n3 = 0;
        printf("请输入3个数:\n");
        scanf("%f%f%f",&n1,&n2,&n3);
        if (n1 >= n2 + n3 || n2 >= n1 + n3 || n3 >= n1 + n2) {
            printf("不能构成三角形\n");
        }else{
            printf("能够成三角形\n");
        
        }
        
       
    }
#endif
#pragma mark - 8
#if 0
    /** 输入三个数，用两种方法打印出中间值（即第二大值）*/
    {
        int a = 0,b = 0,c = 0;
        int max = 0,min = 0;
        printf("请输入3个数:\n");
        scanf("%d%d%d",&a,&b,&c);

        max = a > b ? a : b;
        max = max > c ? max : c; //最大值
        min = a < b ? a : b;
        min = min < c ? min : c;//最小值
        if((a == max || a == min) && (b == max || b == min))
        {
            printf("第二大的值为: %d",c);
        }
        if((a == max || a == min) && (c == max || c == min))
        {
            printf("第二大的值为: %d",b);
        }
        if((c == max || c == min) && (b == max || b == min))
        {
            printf("第二大的值为: %d",a);
        }
        
        if(((a > b && a > c) || (a < b && a < c)) && ((b > a && b > c) || (b < a && b < c)))
        {
            printf("第二大的值为: %d",c);
        }
        if(((a > b && a > c) || (a < b && a < c)) && ((c > b && c > a) || (c < b && c < a)))
        {
            printf("第二大的值为: %d",b);
        }
        if(((c > b && c > a) || (c < b && c < a)) && ((b > a && b > c) || (b < a && b < c)))
        {
            printf("第二大的值为: %d",a);
        }
        
        
        
        
    
    }
#endif
#pragma mark - ATM
#if 0
    /* 综合练习: ATM机取款
     * 通过if语句实现银行取款功能
     (1).先用if判断卡号是不是有效，然后用if…else…提示用户账户有效或者无效。
     (2).引导学员完成判断输入一次密码。
     (3).引导学员用if嵌套实现三次输入密码逻辑。
     (4).引导学员用级联式if语句实现存款、取款、查询余额功能。
     */
    {
        long card = 0, passWord = 0;
        long myCard = 666555444333, mypwd = 111111;
        int make = 0 , min = 0, add = 0;
        int money = 500;
        
        printf("请输入卡号: \n");
        scanf("%ld",&card);
        if (myCard == card) {
            printf("正确账户\n");
            printf("请输入密码: \n");
            scanf("%ld",&passWord);
            if (mypwd == passWord) {
                printf("输入正确! \n");
                printf("输入 1 存款 2 取款 3 查询 \n");
                scanf("%d",&make);
                if ( 3 == make) {
                    printf("您的余额:%d \n",money);
                }
                if (2 == make) {
                    
                    printf("输入取款金额: \n");
                    scanf("%d",&min);
                    if ( min <= money) {
                        money = money - min;
                        printf("您的余额:%d \n",money);
                    }else{
                        printf("您的余额不足!\n");
                    }
                        
                }
                if (1 == make) {
                    printf("输入存款金额: \n");
                    scanf("%d",&add);
                    money = money + add;
                    printf("您的余额:%d \n",money);
                    
                }
                
            }else {
                printf("密码输入错误,您还有2次机会 \n");
                printf("请再次输入:");
                scanf("%ld",&passWord);
                if (mypwd == passWord) {
                    printf("输入正确! \n");
                    printf("输入 1 存款 2 取款 3 查询 \n");
                    scanf("%d",&make);
                    if ( 3 == make) {
                        printf("您的余额:%d \n",money);
                    }
                    if (2 == make) {
                        
                        printf("输入取款金额: \n");
                        scanf("%d",&min);
                        if ( min <= money) {
                            money = money - min;
                            printf("您的余额:%d \n",money);
                        }else{
                            printf("您的余额不足!\n");
                        }
                        
                    }
                    if (1 == make) {
                        printf("输入存款金额: \n");
                        scanf("%d",&add);
                        money = money + add;
                        printf("您的余额:%d \n",money);
                        
                    }
                }else{
                    printf("密码输入错误,您还有1次机会 \n");
                    printf("请再次输入:");
                    scanf("%ld",&passWord);
                    if (mypwd == passWord) {
                        printf("输入正确! \n");
                        printf("输入 1 存款 2 取款 3 查询 \n");
                        scanf("%d",&make);
                        if ( 3 == make) {
                            printf("您的余额:%d \n",money);
                        }
                        if (2 == make) {
                            
                            printf("输入取款金额: \n");
                            scanf("%d",&min);
                            if ( min <= money) {
                                money = money - min;
                                printf("您的余额:%d \n",money);
                            }else{
                                printf("您的余额不足!\n");
                            }
                            
                        }
                        if (1 == make) {
                            printf("输入存款金额: \n");
                            scanf("%d",&add);
                            money = money + add;
                            printf("您的余额:%d \n",money);
                            
                        }
                    }else{
                        printf("您的账户已被冻结24小时!");
                    }
                
                
                }
            
            }
        }else{
            printf("无效账户\n");
        }
    
        
        
        
        
        
        
        
        
        
    
    
    
    
    }
#endif
    return 0;
}
