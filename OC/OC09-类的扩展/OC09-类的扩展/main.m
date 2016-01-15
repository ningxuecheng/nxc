//
//  main.m
//  OC09-类的扩展
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+AddMethod.h"
#import "NSString+Chara.h"
#import "Person.h"
#import "AddressBook.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
#pragma mark - 知识点1: category(类目, 分类)
     /**
      * 类目的作用:
      * 1. 编写.h文件时,将众多方法分类,以便查看接口时方便(入系统类的.h文件)
        
        2. 扩展类的方法, 一般针对没有源代码的类(如系统nsstring类等)
      
      
     */
     
        
        
        /** 需求: NSString添加一个sayHi方法 
            详见 类目文件: NSString + AddMethod
         
         */
        
        [NSString sayHi];
#pragma mark ** 练习
        
     /** 为NSString类扩展一个新的方法，要求获取字符串的首字母并且将该首字母大写。*/
        
      NSString *str = @"beijing";
        
        
        NSLog(@"%@",[str chara]);
        
#pragma mark - 知识点2: 类的延展
     /**
      * 使用延展的目的:
      * 有一些属性和方法, 类的内部实现需要, 但不希望外部访问
      * 所以需要将这些属性和方法隐藏起来, 即私有化.
      *
      * 详见: AddressBook类.
      *
      *
      *
      *
      *
      *
      *
      */
        
        Person *per1 = [[Person alloc] init];
        per1.name = @"shun";
        
        AddressBook *ab = [[AddressBook alloc] init];
        
        [ab addContact:per1];
        
        
        
        
        
        
        
        
        
        
    }
    return 0;
}
