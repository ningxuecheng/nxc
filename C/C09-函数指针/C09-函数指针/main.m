//
//  main.m
//  C09-函数指针
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

typedef int II;


typedef int (*FUN)(int, int);
/** 函数: 参数含有函数指针 */

int getValue(int , int , int (*)(int , int ));

int getValue(int x, int y, int (*p)(int , int )) {
    

    int value = p(x,y);
 
    return value;

}

//声明函数 求两个数的乘积
int chengValue (int , int);
int chengValue (int x, int y) {
   
    return x * y;

}



//声明函数 求两个数最大数的函数

int maxValue(int x, int y);

int maxValue(int x, int y) {
    return x > y ? x : y;
}


//函数:返回两个数的和

int sumNum(int x, int y);

int sumNum(int x, int y) {

    return x + y ;

}
void printHello();
void printHello() {

    printf("hello!\n");
  

}


//排序数组
void sortArr(int arr[], int count) {
    int temp = 0;
    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - 1 - i; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

void printArr(int *arr,int n) {

    for (int i = 0; i < n; i++) {
        printf(" %d",*(arr + i));
    }
               printf("\n");

}



//排序指针
void paiArray(int *,int);

void paiArray(int *array,int n) {
    int temp = 0;
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - 1 - i; j++) {
            if (*(array + j) > *(array + j + 1)) {
                temp = *(array + j);
                *(array + j) = *(array + j + 1);
                *(array + j + 1) = temp;
               
            }
        }
    }
    for (int i = 0; i < n; i ++) {
        printf(" %d",*(array + i));
    }
    printf("\n");

}


int main(int argc, const char * argv[]) {
   
    
#pragma mark - 知识点 1 函数指针定义和使用
    
#if 0
/** 函数指针 就是指针指向函数(代码区) */
    printf("%d\n",maxValue(3, 5));
    
//查看代码区, 查看maxValue的地址 和sumNum的地址内存
    printf("%p\n",maxValue);
    
    printf("%p\n",sumNum);
    
/**如何确定函数指针类型!!!
 * 技巧 函数声明部分,将函数名去掉就是函数指针类型
 *      函数指针变量如何定义
 *
 * 技巧 函数声明部分,将函数名替换成(*p)其中的p是指针变量名
 *
 */
#endif
 #if 0
    int (*p) (int x, int y) = NULL;
    /** 上面语法说明
     指针类型: int (*)(int x, int y)
     指针变量名: p
     指针变量值: NULL
     */
    int *p2 = NULL;    // int a = 100;
    int (*arr)[5] = NULL; // int arr[5]
#endif
#if 0 //指针数组, 数组指针 容易混淆的概念
    
    int * array[5] = {}; //指针数组 是一个数组 其中array是数组名,
                          // 5 是元素个数  int * 数组中存放的指针的指针类型
    
    int (*array2)[5] = NULL; //数组指针 其中array2是指针的变量名,int * [5]是指                                               针类型, array2 + 1 ,访问下一个 20  字节内容
#endif
#if 0
    //函数指针赋值
    
    int (*p) (int , int ) = NULL;
    
    p = maxValue; //将指针指向了 maxValue函数代码的首地址
                    //注意 指针类型和函数的类型要一致 包括返回值和参数列表
    
    /** 通过 函数指针 调用函数*/
    p(3,5);
   
    printf("\n%d\n",p(3,5));
    
    p = sumNum;  //将函数指向sumNum函数代码
    
    printf("%d\n",p(3,5));
    
#endif
#pragma mark - 练习**
#if 0
    /** (1). 定义可以指向系统strlen函数的指针 */
   
    
   char  string[] = "dasda";
    size_t	 (*p3)(const char *) = NULL;
    p3 = strlen;
    printf("%ld\n",p3(string));
    
    
    /** (2). 定义一个指向系统strcpy函数的指针 */
    char string2[20] = "";
    
    char	*(*p4)(char *, const char *) = NULL;
    p4 = strcpy;
    p4(string2,string);
    printf("%s\n",string2);
    
    /** (3). 定义函数指针指向printHello函数. 并用函数指针调用函数 */
    
    void (*p2)() = NULL; //定义一个指针变量
    p2 = printHello;    // 变量赋值
    p2();                // 通过函数指针 调用函数
    
    /** (4). 定义函数指针调用排序函数 */
    
    
    int array[5] = {123,4,5,12,0};
    void (*pai)(int *array,int n) = NULL; //声明函数指针
    pai = paiArray; //指针指向函数
    pai(array,5);
    
    void (*sortp)(int arr[], int count) = NULL;
    int array2[5] = {123,3,5,34,2};
    void (*printArry)(int *arr,int n) = NULL;
    sortp = sortArr;
    printArry = printArr;
    sortp(array2,5);
    printArry(array2,5);
    
#endif
    
#if 0
    /** (5). 定义两个 函数 ,一个求 最大值,一个 求和,输入maxValue或sumValue分别求 3 , 5的最大值或和
     
     * (提示,定义一个 函数指针 ,根据输入内容指向不同函数,最后一次调用完成)。
     */

    char string[20] = {};
    printf("请输入:\n");
    scanf("%s",string);
    
    int (*p)(int x, int y) = NULL;
   //根据输入不同的字符串
    if (strcmp(string , "maxValue") == 0 ) {
        
        
        
        
    }
    
#endif
#pragma mark - 知识点 2 函数回掉 (callback)
    /** 本质: 函数指针作为函数的参数  */
    
    /** 求两个数最大 */
    int max = getValue(3, 5, maxValue);
    printf("%d\n",max);
    
    /** 求两个数的和*/
    
    int sum = getValue(3, 5, sumNum);
    
    printf("%d\n",sum);
    
    /** 求两个数的乘积  */
    
    int ji = getValue(3, 5, chengValue);
    printf("%d\n",ji);
    
#pragma mark - **练习
    /** 写一个函数查找成绩在90分以上的学员,使用函数在名字后面加高矮富帅      */
    
    Student stu1 = {"zhang",22,89};
    Student stu2 = {"wang",20,90};
    Student stu3 = {"lang",30,87};
    Student stu4 = {"chang",10,99};
    Student stu5 = {"dang",80,50};
    Student arrstu[5] = {stu1,stu2,stu3,stu4,stu5};
    //调用函数 查找函数
    selectStu(arrstu, 5, chengName);
    //selectStu(arrstu, 5, chengScore);  //此时调用函数是还是分数大于90的+5
                                       //因为select函数内的判断条件是固定的
                                       //即 stu.score > 90,那么如何判断条件的动态变化,请见动态排序
    infoStu(arrstu, 5);
    
    
#pragma mark - 知识点 3 动态排序
    printf("\n-------\n");
    //按照名字
    sortArrmy(arrstu, 5, cmpName);
    infoStu(arrstu, 5);
    
    /**按分数排序*/
    printf("\n-------\n");

    sortArrmy(arrstu, 5, cmpScore);
    infoStu(arrstu, 5);
    /**按年龄排序*/
    printf("\n-------\n");
    
    sortArrmy(arrstu, 5, cmpAge);
    infoStu(arrstu, 5);
#pragma mark - 知识点 4 函数指针类型重定义(typedef)
    FUN point = maxValue;
    
    printf("%d\n",point(2,4));
    
    return 0;
}
