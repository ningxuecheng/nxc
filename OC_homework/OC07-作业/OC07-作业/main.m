//
//  main.m
//  OC07-作业
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"
#import "OurClass.h"
int main(int argc, const char * argv[]) {
    
    
    Student *mystu1 = [[Student alloc] initWithName:@"lisi" age:20 number:@"12345601"];
    
    Student *mystu2 = [[Student alloc] initWithName:@"zhangsan" age:15 number:@"12345602"];
    
    Student *mystu3 = [[Student alloc] initWithName:@"wangwu" age:25 number:@"12345603"];
    
    
    Teacher *tea1 = [[Teacher alloc] initWithName:@"sunming" age:30 myclass:@"dl6"];
    
    NSMutableArray *arr = @[mystu1,mystu2,mystu3].mutableCopy;
    
    
    [arr sortUsingSelector:@selector(compareAge:)];
    for (Student *stu in arr) {
        NSLog(@"name%@ age%ld",stu.name,stu.age);
    }
    
    Student *mystu4 = [[Student alloc] initWithName:@"dufu" age:23 number:@"12345604"];
    
    OurClass *our = [[OurClass alloc] init];
    our.tea = tea1;
    our.stuArr = arr;
    
    [our addStu:mystu4];
    
    [our minStu:mystu3];
    for (Student *stu in our.stuArr) {
        NSLog(@"name:%@",stu.name);
    }
    
    
    [tea1 addValue:our.stuArr];
    
    for (Student *stu in our.stuArr) {
        NSLog(@"name:%@ score:%@",stu.name,[stu.dicStudy valueForKey:@"chinese"]);
    }
 
    
    
//    实现班级信息程序
//1、定义3个类：OurClass、Teacher、Student。
//2、Teacher类，属性：姓名、年龄、班级，方法：考试(exam:)。
//3、Student类，属性：姓名、年龄、学号、成绩，方法：比较年龄。
//4、OurClass类，属性：老师、学生，方法：添加学生和移除学生。
//提示：
//1、Person类作为Student、Teacher类的父类，公共属性和方法写在Person类中。
//2、Student的成绩为NSMutableDictionary类型，存储课程名称和成绩。
//3、Teacher的考试内部实现随机为班级每个学生的某一科赋值。
//4、OurClass的学生为NSMutableArray类型，内部存Student的对象。
    
    
    
    
    
    
    
    return 0;
}
