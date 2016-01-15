//
//  main.m
//  C07-作业-宁学成
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyFunction.h"

int main(int argc, const char * argv[]) {
  //1. 输入10个整数，将其中最小的数与第一个数对换，把最大的数和最后一个数对换，指针实现
#pragma mark - 1

    int array[10] = {2313,2,25,87,6,465,4,545,45,58};
    exchangeNum(array, 10);
    
#pragma mark - 2
    char string1[] = "a12b34c45d67g";
    noNum(string1);
    
    float a = 0,b = 0,c = 0;
    printf("请输入三个值:\n");
    scanf("%f%f%f",&a,&b,&c);
    
    changeNum(&a, &b, &c);
    
    
   
    
    
    
    
    
    return 0;
}
