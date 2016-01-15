//
//  main.m
//  OC03- 作业-44-宁学成
//
//  Created by dllo on 15/11/19.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    /*
     1.求1 X 2 X 3 X 4 X ... X 19 X 20的结果?
     2.打印1-100的数,并求1-100之和,奇数之和,偶数之和。
     3.随机产生20个[10 , 100]的正整数,输出这些数以及他们中的 最大数。
     4.编程将所有“水仙花数”打印出来,并打印其总个数。 “水仙 花数”是一个各个位立方之和等于该整数的三位数(个位数立 方 + 十位数立方 + 百位数立方 = 这个整数)。
     5.已知abc+cba = 1333,其中a、b、c均为一位数,编程求出 满足条件的a、b、c所有组合。
     6.输入两个数,求最大公约数和最小公倍数。(两种方法:辗 转相除法和普通方法)。
     7.找出1-99之间是7的倍数或者个位数字是7或者十位数字是7 的数字,并输出这些数字,统计有多少个?
     
     */
#pragma mark - 1
#if 0
    {
        long i = 0,j = 0,max = 1;
        for (i = 0; i < 20; i++) {
            j = j + 1;
            max = j * max;
        }
        printf("max: %ld \n",max);
        
    }
#endif
#pragma mark - 2
#if 0
    {
        int i = 0, add = 0,add1 = 0 , add2 = 0;
        for (i = 0; i < 100; i++) {
            printf("%d\n",i +1);
            add = i + 1 + add;
            if (i % 2 == 0) {
                add2 = i + 1 + add2;
            }else {
                add1 = i + 1 + add1;
            }
        }
        printf("1 - 100之和: %d \n",add);
        printf("奇数之和: %d \n",add1);
        printf("偶数之和: %d \n",add2);
    
    }
    
#endif
#pragma mark - 3
#if 0
    {
      /**公式 arc4Random() % (b - a + 1) + a */
        int a = 10 , b = 0,i = 0;
        for (i = 0; i < 20; i++) {
            a = arc4random() % (100 - 10 + 1) + 10;
            printf(" %d ",a);
            b = b > a ? b : a;
        }
        printf("\n");
        printf("最大数 b: %d\n",b);
    
    }
    
#endif
#pragma mark - 4
#if 1
    //个位数立 方 + 十位数立方 + 百位数立方 = 这个整数
    //将所有“水仙花数”打印出来,并打印其总个数 100 - 999
    {
        int i = 100,a = 0,b = 0,c = 0,d = 0;
        for (i = 100; i <=999 ; i++) {
            a = i % 10; //个位
            b = (i / 10) % 10; //十位
            c = i / 10 / 10; //百位
            if (i == a*a*a + b*b*b + c*c*c) {
                printf("%d ",i);
                d = d + 1;
            }
        }
        printf("有%d个\n",d);
    
    
    }
#endif
#pragma mark - 5
#if 0
    //已知abc+cba = 1333,其中a、b、c均为一位数,编程求出 满足条件的a、b、c所有组合。
    {
        int  a = 0,b = 0 ,c = 0,num1 = 0,num2 = 0 ;
        for (a = 0; a < 10; a++) {  //i 为 a 时
            for (b = 0; b < 10; b++) {
                for (c = 0; c < 10; c++) {
                    num1 = a*100 + b*10 + c;
                    num2 = c*100 + b*10 + a;
                    if (1333 == num1 + num2 ) {
                        printf("abc: %d cba: %d \n",num1,num2);
                    }
                }
            }
        }
    
    }
#endif
#pragma mark - 6
#if 0
    //输入两个数,求最大公约数和最小公倍数。(两种方法:辗 转相除法和普通方法)。
    //小学奥数专题讲解
    //辗转相除法是求最大公约数和最小公倍数的另一种方法。     具体做法是：
    //用较小数除较大数，再用出现的余数（第一余数）去除除数，再用出现的余数（第二余数）去除第一余数，如此反复，直到最后余数是0为止。如果是求两个数的最大公约数，那么最后的除数就是这两个数的最大公约数。把这些数相乘就是最小公倍数
    {
        int a = 0 ,b = 0,c = 0,d = 1,a1 = 0, b1 = 0;
        printf("请输入两个数:\n");
        scanf("%d%d",&a,&b);
        a1 = a;
        b1 = b;
        while (0 != a % b ) {
            c = a % b;
            a = b ;
            b = c ;
        }
        if (c == 0) {
            d = a;
            printf("最大公约数数是:%d\n",b);
        }else{
            d = a1 * b1 / c;
            printf("最大公约数数是:%d\n",c);
        }
        printf("最小公倍数是:%d\n",d);
    }
    
#endif
#pragma mark - 7
#if 0
    { int i = 0,j = 0;
        for (i = 1; i < 100; i++) {
            if ((i % 10 == 7) || ( i / 10 == 7) || ( i % 7 == 0)) {
                j = j + 1;
                printf("%d \n",i);
            }
        }
        printf("有%d个",j);
        
    
    
    }
    
#endif
#pragma mark - 8
#if 0
    /**输入n，分别用*输出边长为n的实心菱形和空心菱形。
     例如：n = 3时，输出：
      *
     ***
    *****
     ***
      *
     
       *
      * *
     * * *
      * *
       *
     */
    {
        int n = 0;
        printf("请输入边长: \n");
        scanf("%d",&n);
        
        
    
    
    }
    
#endif
    
    return 0;
}
