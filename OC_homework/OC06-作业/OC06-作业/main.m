//
//  main.m
//  OC06-作业
//
//  Created by dllo on 15/12/8.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
   
    //    要求 ：
    //    1、创建1个包含5个字符串元素的数组；
    //    2、用for循环倒序输出所有元素；
    //    3、用for...in完成所有字符串元素的拼接(生成一个
    //      新的字符串)，并输出拼接好的字符串。
#if 0
    
    NSArray *arr = @[@"ming",@"qing",@"tang",@"song"];
    
    
    for (int i = 0; i < arr.count; i++) {
        NSLog(@"%@",arr[arr.count - i - 1]);
    }
    
    NSMutableString *new = [NSMutableString stringWithFormat:@""];
    for (NSString *str in arr) {
       [new appendFormat:@"%@",str ];
    }
    /**
     
    NSString *new2 = [[NSString alloc] init];
    for (NSString *str in arr) {
        *new2 = [new2 stringByAppendingString:str];
    }*/
    
    NSLog(@"%@",new);
    //NSLog(@"%@",new2);
#endif
    
    /** 要求：
     1、创建1个包含5个person对象的数组(姓名用英文)；
     2、用for循环找到年龄最大的Person对象；
     3、用for...in遍历数组，把大于某个年龄的Person对象的姓名后面拼接上字符串“-brother”。
     */
    
    
    Person *per1 = [[Person alloc] initWithName:@"lili" sex:@"male" age:20];
    Person *per2 = [[Person alloc] initWithName:@"zhangsan" sex:@"male" age:15];
    Person *per3 = [[Person alloc] initWithName:@"wangwu" sex:@"male" age:18];
    Person *per4 = [[Person alloc] initWithName:@"sunming" sex:@"male" age:25];
    Person *per5 = [[Person alloc] initWithName:@"jiangming" sex:@"male" age:30];
    
    NSArray *marr = @[per1,per2,per3,per4,per5];//装了5个person类型的指针
   
    Person *temp = nil; //person类型的指针
    for (NSInteger i = 0; i < marr.count - 1; i++) {
        temp = marr[i];/** */
        if (temp.age) {
            
        }
        
        temp = [marr[i] maxAge:marr[i + 1]];
        
    }
    NSLog(@"最大年龄:name%@ age%ld",temp.name,temp.age);
    
    for (Person *per in marr) {
        if (per.age > 20) {
          per.name = [per.name stringByAppendingString:@"-borther"];
        }
        NSLog(@"name:%@ age:%ld",per.name,per.age);
    }

    
    /** 要求 ：
     1、使用第二题目中生成的数组；
     2、使用sortUsingSelector: 分别按年龄，姓名，性别进行排序，输出排序结果；
     3、使用NSSortDescriptor，按姓名进行排序。
     */
#if 0
    NSMutableArray *marr2 = marr.mutableCopy;
    
    [marr2 sortUsingSelector:@selector(compareWithName:)];
    
    for (Person *per in marr2) {
        NSLog(@"%@",per.name);
    }
    
    
    [marr2 sortUsingSelector:@selector(compareWithAge:)];
    
    for (Person *per in marr2) {
        NSLog(@"%ld",per.age);
    }
    
    NSSortDescriptor *des = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
   [marr2 sortUsingDescriptors:@[des]];
    
    
    for (Person *per in marr2) {
        NSLog(@"%@",per.name);
    }
    
#endif
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
