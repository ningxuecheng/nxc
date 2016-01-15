//
//  main.m
//  C05_函数
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 1 函数分类

#if 1
       /**  函数分为库函数(系统提供的函数)
             自定义函数(开发者自己定义的函数)*/

    /**函数的语法
     * 返回值类型 函数名(形式参数列表){
     
          语句
          return 返回值 注意:返回值类型要和函数开头部分的返回值类型一致
       }
      */
    
    /** 1.无返回值,无参数的函数  */
    void printHello() {
        printf("hello");
        return; /**对于无返回值的函数,return通常省略,但是如果加上return,是可以的,
                但是return后面的语句不执行
                */
    }
   /**  2.无返回值有参数的函数  */
void printNumber(int x, int y ){
    printf("%d%d",x,y);
}
 /** 3.有返回值,无参数的函数 */
int numberTen(){
    printf("有返回值,无参数的函数");
    return 10; /**对于有返回值类型的函数,必须有返回值,且返回值类型一致*/
    /**4.有返回值,有参数*/
}



    int sum(int x, int y) {
    
        return x + y;
    }



int maxNum(int max , int b) {
    if (max > b) {
        return max;
    }else {
    
        max = b;
        return max;
    
    }
}
/** (2). 定义求两个整型数的和，在该函数中打印和，不用把和返回给主调函数 */

void addNum(int z , int a ) {
    
    printf("%d", a + z );
    
}
/** (3). 编写函数int sumValue(int n)：计算1到n的和 */

int sumValue(int n) {
    int k = 0;
    for (int i = 0; i < n; i++) {
        k = k + (i + 1);
    }
    return k;
}
/** (5). 编写函数，返回正整数n中的数字的个数 */
int numNumber(int n){
    int count = 0;
    do {
        count++;
    } while (n /= 10);
    return count;
}
    

#endif

#pragma mark - 2 函数声明和定义
#if 1
/** 函数的声明 
    后面有 ; 号
    函数的生命 其中参数列表部分 参数名可以省略*/
int min(int x, int y);
int min2(int , int);
/** 函数的实现(定义)  
    函数的实现 其中参数列表部分,参数名必须有*/
int min(int x, int y) {
 
    return x < y ? x : y;
}

int min2(int x , int y ) {

    return x < y ? x:y;
  
}

#endif
#pragma mark - 4 形参实参
#if 0
     /** 在工程中,通常江函数的声明和实现单独放在不同的文件中 目的 节耦和方便
          详见 C05_2函数  工程 */


     /** 注意: 函数调用时 形参会拷贝实参内容,单向传递,实参传给形参
         详见 "c05_2函数"工程*/
//写一个交换两个整形变量 的函数;


#endif
#pragma mark - 5 函数嵌套调用
#if 0



#endif

#pragma mark - 主函数
int main(int argc, const char * argv[]) {
#pragma mark - 3 函数调用
#if 0
    
    /** 1.调用系统函数 printf()*/
    printf("hello word");
    /** 2.调用自定义函数 */
    printHello();
    printNumber(12, 10);
    printf("\n");
    
    numberTen();
    printf("%d",numberTen());
    
    sum(3, 5);
    printf("sum = %d",sum(3, 5));
#endif
#pragma mark - 练习
#if 1
    /** (1). 定义求两个整型数的最大值，并且把最大值返回给主调函数。 */
    int a = maxNum(3, 5);
    printf("%d",a);
    addNum(5,5);
    sumValue(5);
    printf("------\n");
    printf("%d\n",sumValue(5));
    printf("%d\n",numNumber(12));
    
    
#endif
    return 0;
}
#pragma mark - 主函数下方
#if 0
void down() {
    
    printf("dasdasdad");

}
#endif
