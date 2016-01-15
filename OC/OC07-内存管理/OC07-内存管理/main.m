//
//  main.m
//  OC07-内存管理
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
   
    
#pragma mark - 知识点1 影响内存引用计数的方法
    
    /**增加: alloc retain copy
       减少: release autuorelease
     
     查看引用计数: retainCount 切记此方法不要再工程中调用,有时显示错误
     
     **/
#if 0
    Person *per1 =[[Person alloc] init];
    
    NSLog(@"%ld",per1.retainCount);
    
    [per1 retain];
    [per1 release];
    NSLog(@"%ld",per1.retainCount);/** 注意此时per1的引用计数为0
                                    但是retainCount的方法显示为1,此方法
                                    不够准确
                                    */
    
    Person *per2 = [[Person alloc] init];
    [per2 retain];//计数2
    
    @autoreleasepool {
        [per2 autorelease];//此时不立即减1 出池后减1
        NSLog(@"%ld",[per2 retainCount]);
    }
    
    NSLog(@"%ld",[per2 retainCount]);
   
#endif
    
#pragma mark - 知识点2 属性的内存管理
    
    /**
     *属性的内存管理主要是setter方法的内部实现细节
     *
     *详见 Person类的_name的setter方法;
     *              _age 的setter方法;
     *
     *总结: setter 方法的具体实现,不用开发者编写,属性自动实现
     *      系统会采用哪种setter实现方法呢?
     *      由定义属性是的语义字段决定(assign retain copy);
     */
    
#pragma mark - 知识点3 重写dealloc方法
    
    /**
     *为什么要重写dealloc方法
     *原因:对象类型的实例变量(_name),他的setter方法会引起引用计数多1
     *    所以要在适当的时候,将引用计数减1,就是在整个对象释放之前,所以重写
     *    dealloc方法
     *
     *详见:Person类
     *
     */
    
    
#pragma mark - 知识点4 属性的getter方法实现
    
    /**
     * 详见person的_name 的getter方法.
     *
     * 注意:当同时编写setter 和 getter 方法时,系统会提示变量不识别,解决办法:加上
     * @synthsize 属性 = _属性名
     *
     *
     */
    
#pragma mark - 知识点5 遍历构造器的内存问题
    
    /**
     *  详见 Person类
     *
     *
     *
     *
     */
    
#pragma mark - 知识点6 init 初始化方法内部实例变量的写法问题
    
    /** 详见Person类 */
    
    
#pragma mark - 知识点7 KVC(key-Value-Coding)
    
    /** 创建一个类: Student, 父类NSObject 
     *  只声明实例变量, 不声明属性,没有setter getter 方法*/
    
    
    Student *stu1 = [[Student alloc] init];
    
    /** 对实例变量访问,使用KVC实现实例变量的访问 */
    
    [stu1 setValue:@"TOM" forKey:@"name"];
    
    [stu1 setValue:@20 forKey:@"age"];
    
    [stu1 setValue:@"male" forKey:@"sex"];
    
    NSLog(@"%@",[stu1 valueForKey:@"name"]);
    NSLog(@"%@", [stu1 valueForKey:@"sex"]);
    
    NSDictionary *dic = @{@"name":@"zhangsan",
                          @"age":@20,
                          @"sex":@"male"
                          };
    /** 使用 KVC 将字典中的值赋给对象的实例变量 */
    Student *stu2 = [[Student alloc] init];
    
    [stu2 setValuesForKeysWithDictionary:dic];
    
    
    NSString *name = [[NSString alloc]initWithString:@"张三"];
    NSLog(@"%ld",[name retainCount]);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
