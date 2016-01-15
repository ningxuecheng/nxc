//
//  Function.m
//  C07-指针
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Function.h"


void exchangNum(int *a,int *b) {
    int temp = *a;  //取值
    *a = *b;
    *b = temp;
 
}
void sortBub(int *a,int b) { //b 作为数组的个数
    int temp = 0;
    for ( int i = 0; i < b - 1; i++) {
        for (int j = 0; j < b-1 - i; j++) {
            if (*(a + j) > *(a+ j +1)) {
                temp = *(a + j);
                *(a + j) = *(a + j + 1);
                *(a + j + 1) = temp;
            }
        }
    }
    for (int i = 0; i < b ; i++) {
        printf("%d ",*(a + i));
    }
    printf("\n");
}
