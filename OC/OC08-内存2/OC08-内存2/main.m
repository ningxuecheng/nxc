//
//  main.m
//  OC08-内存2
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#pragma mark - 知识点1 copy
        /** 要将一个对象进行拷贝,此类必须遵循Coping协议 */
        
        Person *per1 = [[Person alloc] init];
        per1.name = @"tom";
        [per1 retain];
        [per1 retain];
        NSLog(@"%ld",per1.retainCount);
      Person *per2 = [per1 copy];
        NSLog(@"pername:%@",per2.name);
        [per2 release];
        [per1 release];
        
        
#pragma mark - 知识点2 OC的运行时和编译时
     /** 编译按照指针类型(对象类型)处理
         运行时按照iSA指向的类对象进行处理
      */
        
        
        
        
    }
    return 0;
}
