//
//  MyFunction.m
//  C05_2函数
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "MyFunction.h"

/**  函数的声明 */
int max(int x, int y ){
    return x > y ? x : y;

}


void addOfArg(int x, int y){
   /** 输出形参的地址 */
    printf("x add: %p \n",&x);
    printf("y add: %p \n",&y);


}
void changeNum(int x,int y){

    int c = 0;
    c = x;
    x = y;
    y = c;
    printf("a: %d\nb: %d\n",x,y);

}

int maxNum(int q,int w){
    return q > w ? q : w;
}
int maxNum3(int a, int b, int c){
    int max = 0;
    max = a > b ? a : b;
    max = max > c ? max : c;
    return max;
}
void maxNum4(int a, int b, int c, int k){
    
   
    printf("%d\n", maxNum(k, maxNum3(a, b, c)));


}
void maxNum5(int a, int b, int c, int k, int j){

    printf("%d\n",maxNum(j, maxNum(k, maxNum3(a, b, c)) ));

}
void sortArray(int array[], int count){
    /** 冒泡排序*/
    int temp = 0;
    int flag = 1;
    for (int i = 0; i< count - 1 && 1 == flag; i++) {
        flag = 0;
        for (int j = 0; j < count - 1 -i; j++) {
            if (array[j] > array[j+1]) {
                temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
                flag = 1;
            }
        }
    }
    for (int i = 0; i < count ; i++) {
        printf(" %d ",array[i]);
    }
    printf("\n");




}







