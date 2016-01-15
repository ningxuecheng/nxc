//
//  MyFunction.m
//  C06_作业_宁学成
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "MyFunction.h"
/**某班有5个学生，三门课。分别编写3个函数实现以下要求：
 （1） 求各门课的平均分；
 （2） 找出有两门以上不及格的学生，并输出其学号和不及格课程的成绩；
 （3） 找出三门课平均成绩在85-90分的学生，并输出其学号和姓名
 
 */

void avgStudy(StuStudy array[5]) {
    float avgchi = 0,avgmah = 0, avgeng = 0;
    
    for (int i = 0; i < 5; i++) {
        
        avgchi += array[i].chinese;
        avgeng += array[i].english;
        avgmah += array[i].math;
    }
    
    
    
    
    
    
    printf("avg chinese = %f\n",(avgchi / 5) * 1.0);
    printf("avg mah = %f\n",(avgmah / 5) * 1.0);
    printf("avg eng = %f\n",(avgeng / 5) * 1.0);

}
void noStudent(StuStudy array[5]) {
    
    for (int i = 0; i < 5; i++) {
        if (array[i].chinese < 60 && array[i].english < 60 && array[i].math < 60) {
            
            printf("学号是:%d \n",array[i].stuid);
            printf(" 不及格科目是 中文");
            printf("成绩是:%d\n",array[i].chinese);
            printf(" 不及格科目是 英文");
            printf("成绩是:%d\n",array[i].english);
            printf(" 不及格科目是 数学");
            printf("成绩是:%d\n",array[i].math);
            
        } else
            if (array[i].chinese < 60 && array[i].math < 60) {
            printf("学号是:%d \n",array[i].stuid);
            printf(" 不及格科目是 中文");
            printf("成绩是:%d\n",array[i].chinese);
            printf(" 不及格科目是 数学");
            printf("成绩是:%d\n",array[i].math);
        } else
        if (array[i].math < 60 && array[i].english < 60) {
            printf("学号是:%d \n",array[i].stuid);
            printf(" 不及格科目是 中文");
            printf("成绩是:%d\n",array[i].chinese);
            printf(" 不及格科目是 数学");
            printf("成绩是:%d\n",array[i].math);
        } else 
        if (array[i].chinese < 60 && array[i].english < 60)  {
            printf("学号是:%d \n",array[i].stuid);
            printf(" 不及格科目是 中文");
            printf("成绩是:%d\n",array[i].chinese);
            printf(" 不及格科目是 英文");
            printf("成绩是:%d\n",array[i].english);
        }
        
    }

}

void proStudent(StuStudy array[5]) {
    
    float perchi = 0;
    for (int i = 0; i < 5; i++) {
        perchi = (array[i].math + array[i].chinese + array[i].english) / 3 *1.0;
        if (perchi >= 85 && perchi <= 90) {
            printf("学号是: %d\n",array[i].stuid);
            printf("姓名是: %s\n",array[i].name);
        }
        
        
        
    }
}

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


#if 0
void xiangJiao(myRect x,myRect y){
    float x1 = 0,x3 = 0;
    float x2 = 0,x4 = 0;
    float y1,y2,y3,y4 = 0;
     x1 =  x.origin.x;
     x2 = x1 + x.size.width;
    x3 = x.origin.y;
    x4 = x3 + x.size.height;
/** a点*/    y1 = y.origin.x;  //横坐标           // a . ------ . b
             y2 = y.origin.y;  //纵坐标          // c  .        . d
    
    
/**b点*/    y2 = y1 + y.size.width;
           y3 = y1 + y.size.height
    
    
// x点4个坐标 x1 x3
//           x1 x4
//           x2 x3
//           x2 x4

}
#endif

//是否在同一水平线

void tongShui(Pointed x,Pointed y) {

    if (x.y == y.y ) {
        printf("在同一条水平线上\n");
    } else
    {printf("不在同一条水平线上\n");}

}
//同 直
void tongZhi(Pointed x, Pointed y) {

    if (x.x == y.x) {
        printf("在同一垂直线上\n");
    }else
    {printf("不在同一垂直线上\n");}

}
//相等
void xiangDeng(Pointed x, Pointed y) {
    if (x.x == y.x && x.y == y.y) {
        printf("两个点相等\n");
    }else
    {printf("两个点不相等\n");}

}
//是否等高
void hegDeng (Sizeed x, Sizeed y) {
    if (x.height == y.height) {
        printf("等高");
    }else
    {printf("不等高");}


}
//是否等宽
void widDeng (Sizeed x, Sizeed y) {
    if (x.width == y.width) {
        printf("等宽");
    }else
    {printf("不等宽");}

}

//是否相等
void quDeng (Sizeed x, Sizeed y) {
    if (x.width * x.height == y.height * y.width) {
        printf("相等");
    }else
    {printf("不相等");}

}










