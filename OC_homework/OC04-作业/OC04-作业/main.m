//
//  main.m
//  OC04-作业
//
//  Created by dllo on 15/12/3.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    /**
     题目要求：
     1、将“文艺青年”改为“213青年”。
     2、将整数123， 转换为字符串“123”。
     3、将“i love you”中的单词首字母大写“I Love You”。
     4、判断一个字符串是否以http开头，以png结尾，如果是，输出是一个有效链接，如果不是，输出链接错误
     */
#if 0
    NSString *str1 = @"文艺青年";
    NSString *str2 = [str1 stringByReplacingCharactersInRange:[str1 rangeOfString:@"文艺"] withString:@"213"];
    NSLog(@"%@",str2);
    
    
    int a = 123;
    NSString *num = [NSString stringWithFormat:@"%d",a];
    NSLog(@"%@",num);
    
    NSString *love = @"i love you";
    love = [love capitalizedString];
    NSLog(@"%@",love);
    NSString *wang = @"http://wasda.com.png";
    
    if ([wang hasPrefix:@"http"] && [wang hasSuffix:@"png"]) {
        NSLog(@"有效连接");
    }else {
        NSLog(@"无效链接");
    
    }
    

    /** 题目要求：
     1、将整数123，存储为NSNumber类型的对象。
     2、将3.14159，存储为NSNumber类型的对象。
     3、将'c'，存储为NSNumber类型的对象。
     4、将YES，存储为NSNumber类型的对象。
     5、将上述OC的NSNumber类型的对象转回为基本数据类型。
     */
    int a = 123;
    
    NSNumber *num = @(a);
    NSLog(@"%@",num);
    
    NSNumber *num2 = @(3.14159);
    NSLog(@"%@",num2);
    
    NSNumber *num3 = [NSNumber numberWithChar:'c'];
    NSLog(@"%@",num3);
    
    NSNumber *num4 = [NSNumber numberWithBool:YES];
    NSLog(@"%@",num4);
    
    NSLog(@"%d %d %c %d",num.intValue,num2.intValue,num3.charValue,num4.boolValue);
#endif
    
    /** 题目要求：
     1、定义Student结构体，包含姓名，性别，年龄，分数，学号；定义该结构体的变量，并存储为NSValue类型的对象。
     
     2、定义NSRange类型的变量，存储为NSValue类型的对象。
     
     3、将上述NSValue类型的对象，转回为相应的数据类型。
     
     */
    
    struct student {
        char name[20];
        char sex;
        int age;
        float num;
        int Sno;
        
    };
    
     typedef struct student Student ;
    
    
    Student stu = {"lili",'m',18,100,123456};
    
    
    
    NSValue *val1 = [NSValue valueWithBytes:&stu objCType:@encode(Student)];
    
   
   
    NSString *str = [NSString stringWithFormat:@"%s %c %d %.1f %d",stu.name,stu.sex,stu.age,stu.num,stu.Sno];
    
    NSLog(@"%@",val1);
    
    NSLog(@"%@",str);
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
