//
//  main.m
//  OC-5-作业
//
//  Created by dllo on 15/12/4.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

int main(int argc, const char * argv[]) {
    /**实现图书管理系统：
     1、使用数组管理所有书籍。
     2、数组可以添加、删除。
     3、可以从数组根据书名查找书籍，并修改书籍的价格。
     4、展示所有书籍清单（书名）。
     */
    
    
    
    Book *book1 = [[Book alloc] initWithName:@"oc" price:20];
    Book *book2 = [[Book alloc] initWithName:@"UI" price:10];
    
    NSMutableArray *marray = @[book1,book2].mutableCopy;
    
    Book *book3 = [[Book alloc] initWithName:@"ios" price:5];
    
#if 0
    [marray addObject:book3];
    
    for (Book *new in marray) {
        if ([new.name isEqualToString:@"oc"]) {
            new.price = 10;
            NSLog(@"name:%@ price%.2f",new.name,new.price);
           
        }
        [new info];
    }
    
#endif
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    
    [dic setObject:book1 forKey:book1.name];
    [dic setObject:book2 forKey:book2.name];
    [dic setObject:book3 forKey:book3.name];
    
    Book *temp = [dic objectForKey:book1.name];
    
    temp.price = 50;
    
    
    
    
    for (NSString *key in dic) {
        [[dic objectForKey:key] info];
        NSLog(@"%.2f",[[dic objectForKey:key] price]);
    }
    
    
    
    
    
    
    
       return 0;
}
