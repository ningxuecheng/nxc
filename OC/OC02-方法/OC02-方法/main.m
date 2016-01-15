//
//  main.m
//  OC02-方法
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "College.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
#pragma mark - 知识点1 OC的方法语法
         /**
          oc方法分 '+' 类方法 和 '-' 类方法
          '+'类方法中不能有实例变量
          
          
          !!!使用方法时必须明确方法是类方法还是对象方法
         
          方法
          - (NSString *)substringFromIndex:(NSUInteger)anIndex
          
          上面方法 其中
          1. '-' 说明是对象方法 只能对象调用此方法
          2. 返回值类型 为 NSString * (字符串)
          3. 'substringFromIndex' 为参数的形容词
          4. ':' 说明后面有参数
          5. '(NSUInteger)' 参数类型
          6. 'anIndex' 参数名
          7.  方法名:  substringFromIndex:
          
          */
        
        //- (void)insertString:(NSString *)aString atIndex:(NSUInteger)anIndex
        
        
#pragma mark - 知识点2 setter , getter 方法
        /**
           实例变量的默认可见度为@protected,外部不能直接访问(赋值/取值) 
         
           通过方法间接地对实例变量进行访问
         
           涉及到两个方法 及赋值方法, 取值方法 setter getter
        */
        
#if 0
        Person *per1 = [[Person alloc] init];
        
        [per1 setName:@"zhangsan"];
        [per1 setSex:@"male"];
        [per1  setAge:20];
        
        
        NSLog(@"name:%@,sex:%@,age:%ld",[per1 name],[per1 sex],[per1 age]);
        NSLog(@"name:%@",per1.name);
        
        
#pragma mark - 知识点3 继承 封装 多态
         /** 子类继承父类所有的实例变量和方法,实例变量可见度为@private,同样继承下来*/
        
        /** Student继承与 Person类  */
        Student *mystu1 = [[Student alloc] init];
        [mystu1 setName:@"lisi"];
        [mystu1 setSex:@"male"];
        [mystu1 setAge:19];
        [mystu1 setSchool:@"lanou"];
        [mystu1 setNumber:123456];
        
        
        NSLog(@"name:%@ sex:%@ age:%ld school:%@ num:%ld",[mystu1 name],[mystu1 sex],[mystu1 age],[mystu1 school],[mystu1 number]);
        
        
        [mystu1 studyPer];
        
        
        /**创建 college 对象 */
        College *unvirst = [[College alloc] init];
        
        [unvirst setName:@"lisa"];
        [unvirst setAge:20];
        [unvirst setSex:@"woman"];
        [unvirst setSchool:@"jimusi"];
        [unvirst setNumber:04];
        [unvirst setMajor:@"computer"];
        [unvirst setAcodemy:@"xinxi"];
        
        [unvirst studyPer];
        
        NSLog(@"name:%@ sex:%@ age:%ld school:%@ num:%ld major:%@ xueyuan:%@",[unvirst name],[unvirst sex],[unvirst age],[unvirst school],[unvirst number],[unvirst major],[unvirst acodemy]);
#endif
#pragma mark - 知识点4 初始化方法(详见Person类)
        /** 创建一个person对象,并且实例变量赋值 */
#if 0
        Person *person5 = [[Person alloc] init];
        
        [person5 setName:@"lili"];
        [person5 setAge:20];
        [person5 setSex:@"wo"];
        
        Person *person6 = [[Person alloc] initWithName:@"marry" age:20 sex:@"wo"];
        
        Student *stu1 = [[Student alloc] initWithName:@"asd" age:23 sex:@"male" school:@"lanou" number:123];
        
        College *unstu1 = [[College alloc] initWithName:@"qwe" age:456 sex:@"male" school:@"51otc" number:456 major:@"das" acodemy:@"da"];
        
#endif
       
#pragma mark - 知识点5 便利构造器方法(详见 Person类)
       /** */
        
        
        Person *per7 = [Person personWithName:@"dsd" sex:@"ds" age:12];
        
        
        Person *per8 = [Person person];
    }
    return 0;
}
