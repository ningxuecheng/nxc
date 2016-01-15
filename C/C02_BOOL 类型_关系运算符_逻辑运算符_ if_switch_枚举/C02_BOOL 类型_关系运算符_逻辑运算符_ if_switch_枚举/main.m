//
//  main.m
//  C02_BOOL 类型_关系运算符_逻辑运算符_ if_switch_枚举
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
enum phoneNumber {
    caiwu = 8001,
    jishu,
    renshi,
    bangongshi
    
    
};

int main(int argc, const char * argv[]) {

    
#pragma mark - 知识点1 BOOL 数据类型
#if 0    
    {
        BOOL result = 100;
        bool result1 = 100;
        _Bool result2 = 100;
        printf("%d\n",result2);
        printf("%d\n",result1);
        printf("%d\n",result);
        /**
         *BOOL是 OC 中的类型 bool _Bool 是 c 中的类型
         *BOOL 的数值可以是除了0,1的其他值
         *bool _Bool 无论付什么值,结果只有0,1
         */
        BOOL isOn = NO;
        printf("%d\n",isOn);
        BOOL isOpen ;
        printf("open:%d\n",isOpen);
    }
#endif
#pragma mark ** 课堂练习
    {}
#pragma mark - 知识点2 关系运算符
    {
    /**
     *<,>,<=,==,!=, ==是判断是否相等
     *!= 判断不等
     *!取反
     *
     */
    
    
    }
#pragma mark ** 课堂练习
#if 0
    {    //验证 ijk 的排序是否为真
        int i = 3,j = 4,k = 5;
        BOOL result = i < j < k;
        printf("%d\n",result);
    
    
    
    }
#endif
#pragma mark - 知识点3 逻辑运算符
    {
      /**
       *&&,||,!
       *&& 逻辑与 两边表达式都为真 结果才为真
       *|| 逻辑或 两边表达式都为假 结果才为假
       *
       *
       *
       *
       */
    
    
    }
#pragma mark ** 课堂练习
#if 0  
    {
        /**
         * 练习1:
         * 3>5 && 4<6  整个表达式结果?
         * 3<5 && 4<6  整个表达式结果?
         * 3==5 || 3<5 表达式的结果?
         * !0 结果?
         * !-1 结果?
         */
        BOOL result = 3>5 && 4<6; //里边有短路问题
        printf("result: %d\n",result);
        
        BOOL result1 = 3==5 || 3<5;
        printf("result: %d\n",result1);
        
        /**
         * 输入一个整数,判断这个数是否在30到70的范围之间
         */
        int num = 0;
         printf("输入一个数");
        scanf("%d",&num);
        BOOL val  =   30 < num && num < 70 ;
        printf("%d\n",val);
        
    }
#endif
#pragma mark - 知识点4 if 语句, if else ,级联是 if 语句
    {/**
      控制台输入字符, 如果是m输出男性,
      海风  10:55:36
      否则什么都不输出
      */
        /*char sex = 'a';
        scanf("%c",&sex);
        if(sex == 'm'){
            printf("男性");
        
        
        }*/
    
    }
#pragma mark ** 课堂练习
    {/**
      * 输入一个 年份，判断该年份是否是闰年？如果是闰年，则输出该年是闰年，否则输出该年不是闰年
      (提示：闰年：能被400整除或者能被4整除，但是不能被100整除。)
      */
#if 0
        int year  = 0;
        printf("输入一个年份");
        scanf("%d",&year);
        int a = 0,b = 0 ,c = 0;
        a = year % 400;
        b = year % 100;
        c = year % 4;
        if(a == 0 ){
            printf("闰年");
        }
        else if(c == 0 && b != 0){
            printf("闰年");
        }else{
            printf("不是闰年\n");
        }
        
#endif
#if 0
        /**比较两个数的大小*/
        int a = 0,b = 0;
        printf("输入两个数");
        scanf("%d%d",&a,&b);
        if(a > b){
            printf("a:  %d\n",a);
        }
        if (b > a) {
            printf("b:  %d\n",b);
        }
        if(a == b){
            printf("a = b = %d\n",a);
        }
#endif
#if 0
        int num = 0;
        printf("输入一个整数");
        scanf("%d",&num);
        if (num % 7 ==0) {
            printf("7的倍数");
        }
        if(num / 10  == 7 ||num % 10 == 7){
            printf("包含7");
        }
#endif
        /*
        if (条件1) {
            语句1
        } else if(条件2){
            语句2
        }else{
            语句3
        }
        */
        
        /** 控制台输入字符m(男)、f（女）,
         m输出男性，f输出女性。如果即没有输入'm'，又没有输入'f'，性别是什么呢？
         */
        /*
        char sex = '0';
        printf("输入字母");
        scanf("%c",&sex);
        if (sex == 'm') {
            printf("nan");
        } else if(sex == 'f'){
            printf("nv");
            
        }else{
            printf("无效输入");
        }
        
        */
        
        
        
        
    }
#pragma mark - 知识点5 条件运算符
    {
        /*条件表达式 ? :*/
#if 0
        /** 求三个数最大值 */
        int a = 0 ,b = 0 ,c = 0,max1,max2;
        printf("输入三个数");
        scanf("%d%d%d",&a,&b,&c);
        max1 = a > b ? a : b;
        max2 = max1 > c ? max1 : c;
        printf("最大值: %d \n",max2);
        
#endif
    
    
    
    }
#pragma mark ** 课堂练习
#pragma mark - 知识点6 switch 语句
    {
#if 0
        switch (整形表达式) {
            case 值1:
                语句1
                break;
            case 值2:
                语句2
                break;
            
            default:
                语句3;
                break;
        }
#endif
#if 0
        /** 输入  1至 4 输出春夏秋冬*/
        
        int a = 0;
        printf("请输入1 - 4 \n");
        scanf("%d",&a);
        switch ( a ) {
            case 1:
                printf("春");
                break;
            case 2:
                printf("夏");
                break;
            case 3:
                printf("秋");
                break;
            case 4:
                printf("冬");
                break;
                
            default:
                printf("input Error! \n");
                break;
        }
        
        
#endif
#if 0 /** 分机号 输入分机号 显示相应的部门
       *8001 财务8002 技术 8003 人事 8004 办公室 8005 后勤
       */
        int a = 0 ;
        printf("请输入部门号:\n");
        scanf("%d",&a);
        switch ( a ) {
            case 8001:
                printf("财务");
                break;
            case 8002:
                printf("技术");
                break;
            case 8003:
                printf("人事");
                break;
            case 8004:
                printf("办公室");
                break;
            case 8005:
                printf("后勤");
                break;
                
            default:
                printf("无此号码,请从新输入!!!\n");
                break;
        }
        
#endif
#if 0
        /**从键盘输入一个字符，如果是数字打印 this is digital，如果是大写字母，打印 this is  capital letter，如果是小写字母，打印 this is letter，如果是其他字符，打印 other。*/
        char c = 0;
        printf("请输入一个数");
        scanf("%c",&c);
        if (c >= '0' && c<='9') {
            printf("这是数字");
        }else if (c <= 'z' && c >= 'a'){
           
            printf("这是小写字母");
        }else if (c <= 'Z' &&  c >= 'A'){
        
            printf("这是大写字母");
        }else{
            printf("其他");
        
        }
        
#endif
        
    
    }
#pragma mark ** 课堂练习
#pragma mark - 知识点7 枚举类型 enum
#if 0
    {
      /**枚举是一种数据类型
       类似 char,int
       */
        //构造枚举
        enum season {
            spring,
            summer,
            autumn,
            winter
        };
        //定义一个枚举变量
        enum season s = 0; /* enum season 相当于 int   */
        printf("输入一个 0 - 3 之间的数");
        scanf("%d",&s);
        switch (s) {
            case spring:
                printf("春天");
                break;
            case summer:
                printf("夏天");
                break;
            case autumn:
                printf("秋天");
                break;
            case winter:
                printf("冬天");
                break;
                
            default:
                break;
        }
    
    
    
    }
#endif
#pragma mark ** 课堂练习
    { enum phoneNumber phone = 0;
        printf("请输入一个数");
        scanf("%d",&phone);
        switch (phone) {
            case caiwu:
                printf("caiwu");
                break;
            case jishu:
                printf("jishu");
                break;
            case renshi:
                printf("renshi");
                break;
            case bangongshi:
                printf("bangongshi");
                break;
                
            default:
                printf("输入错误");
                break;
        }
    
    
    }
    
    
    
    
    return 0;
}
