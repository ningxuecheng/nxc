//
//  main.m
//  C05_2函数
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>  // <>  导入系统自带的
#import "MyFunction.h"  //"" 导入自己定义的函数

int main(int argc, const char * argv[]) {
    
    /** 函数调用  
        注意,需要导入相应的.h文件(头文件)*/
    int i = max(3, 5);
    printf("%d",i);
    
    
    
    int a = 100,b = 200;
    printf("a add : %p\n",&a);
    printf("b add : %p\n",&b);
    addOfArg(a, b);
    printf("\n");
    
    
    /**交换两个变量的值 
        如果函数的参数直接是变量名,无法实现交换, 如果想交换详见"c06指针章节"*/
    
    changeNum(a, b);
    printf("a:%d \n",a);
    printf("b:%d \n",b);
    
    printf("%d\n",maxNum(2, 3));
    printf("%d\n",maxNum3(2, 6, 5));
    maxNum4(1, 3, 6, 5);
    maxNum5(11, 2, 6, 22, 10);
    int array[5] = {10,22,9,7,4};
    sortArray(array, 5);
    return 0;
}
