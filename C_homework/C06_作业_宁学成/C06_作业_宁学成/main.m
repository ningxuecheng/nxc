//
//  main.m
//  C06_作业_宁学成
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyFunction.h"

int main(int argc, const char * argv[]) {
    
    
    StuStudy student1 = {"misszhang",100,99,58,10001};
    StuStudy student2 = {"misszhang",60,59,58,10002};
    StuStudy student3 = {"misszhang",60,59,58,10003};
    StuStudy student4 = {"misszhang",60,59,58,10004};
    StuStudy student5 = {"misszhang",60,59,58,10005};
    
    StuStudy stuArray[5] ={student1,student2,student3,student4,student5};
    
    avgStudy(stuArray);
    noStudent(stuArray);
    proStudent(stuArray);
    
    
    Pointed x = {1.0,5.5};
    Pointed y = {2.2,5.5};
    Sizeed  a = {50,30};
    Sizeed  b = {30,30};
    tongShui(x, y);
    tongZhi(x, y);
    hegDeng(a, b);
    widDeng(a, b);
    quDeng(a, b);
    return 0;
}
