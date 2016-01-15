//
//  main.m
//  C09-作业-宁学成
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyFunction.h"

int main(int argc, const char * argv[]) {
   
//    作业: 1.随机生成一个 10 个元素的数组,找到 3 的倍数,并将其值修改成 0.(注意:修改数值使用回调函数处理)
    
   

    int array[10] = {};
    int brray[10] = {};
    for (int i = 0 ; i < 10; i++) {
        array[i] = arc4random() % (99 - 1 + 1) + 1;
    }
    for (int i = 0 ; i < 10; i++) {
        brray[i] = arc4random() % (99 - 1 + 1) + 1;
    }
    printArry(array, 10);
    printArry(brray, 10);
#if 0
    changNum(array, 10,*arr );
    printArry(array, 10);
#endif
    exchNum(array, brray, 10, exchangeTwo);
    printf("\n");
    printArry(array, 10);
    printArry(brray, 10);
    int a,b,d=241;
    a=d/100%9;
    b=(-1)&&(-1);
    printf("%d,%d\n",a,b);
    return 0;
}
