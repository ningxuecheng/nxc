//
//  MyFunction.h
//  C06_作业_宁学成
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
/**某班有5个学生，三门课。分别编写3个函数实现以下要求：
（1） 求各门课的平均分；
（2） 找出有两门以上不及格的学生，并输出其学号和不及格课程的成绩；
（3） 找出三门课平均成绩在85-90分的学生，并输出其学号和姓名

 */

struct stuStudy {
    char name[20];
    int  chinese ;
    int  english ;
    int  math    ;
    int  stuid   ;
};

typedef struct stuStudy  StuStudy;

void avgStudy(StuStudy array[5]);

void noStudent(StuStudy array[5]);
void proStudent(StuStudy array[5]);
/**
 创建一个Rect结构体，包含origin，size两个变量。其中origin是Point类型的，size是Size类型的。
 并写以下函数：
 函数1，判断两个Rect是否相交。
 函数2，判断两个Rect是否包含某个Point。
 函数3，判断一个Rect是否在另外一个Rect中。
 题目重点
 结构体声明语法
 if
 printf(“”)
 
 */
struct size {
    float width;
    float height;
};

typedef struct size Sizeed;

struct point {
    float x;
    float y;
    
};
typedef struct point Pointed;

struct rect {
    Pointed origin;
    Sizeed  size;
};
typedef struct rect myRect;

void xiangJiao(myRect x,myRect y);

//是否在同一水平线

void tongShui(Pointed x,Pointed y);

//是否在同一直线上

void tongZhi(Pointed x, Pointed y);
//相等
void xiangDeng(Pointed x, Pointed y);

//是否等宽
void widDeng (Sizeed x, Sizeed y);

//是否等高
void hegDeng (Sizeed x, Sizeed y);

//是否相等
void quDeng (Sizeed x, Sizeed y);











