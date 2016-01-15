//
//  main.m
//  oc08-lianxineicun
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"
#import "OurClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
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
  
        
        
        
    }
    return 0;
}
