//
//  main.m
//  OC09-作业
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+convert.h"

int main(int argc, const char * argv[]) {
   
//    给NSMutableArray添加convert方法，实现数组倒序。

    NSMutableArray *arr = @[@"beijing",@"shanghai",@"tianjing",@"nanjing",@"chengdu"].mutableCopy;
    
    [arr convert];
    
    for (NSString *str in arr) {
        NSLog(@"%@",str);
    }
    
    
    
    
    
    
    
    return 0;
}
