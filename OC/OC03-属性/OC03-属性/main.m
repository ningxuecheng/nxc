//
//  main.m
//  OC03-属性
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#pragma mark - 知识点1 属性
        /** 属性的3个作用 
            1.声明了一个实例变量,名字_属性名
            3.声明和实现get方法
            2.声明和实现set方法  
            详见 person类
         */
        
        
#pragma mark - 知识点2 属性的特性(共3个特性)
        /** 属性的3个特性
         1.可读性
         2.原子性
         3.语义特性
         详见 person类
         */
        
        Phone *iphone = [Phone phoneWithlog:@"iphone" size:5.5 color:@"white"];
        
#pragma mark - 知识点3 点语法
        /** 点 语法指对属性的访问其作用 其他方法 还是 [] 消息语法格式
         */
        Phone *phone1 = [[Phone alloc] init];
        phone1.log = @"Apple";
        phone1.size = 5.5;
        phone1.color = @"black";
        NSLog(@"log:%@ color:%@ size:%f",phone1.log,phone1.color,phone1.size);
        
        
#pragma mark - 练习**   
        
        Fraction *mynumber1 = [Fraction fractionWithNumerator:2 denominator:4];
        Fraction *mynumber2 = [Fraction fractionWithNumerator:2 denominator:3];
        //[mynumber1 yueFun:mynumber1];
        Fraction *result = [mynumber1 addFun:mynumber2];
        Fraction *result2 = [mynumber1 sumFun:mynumber2];
        Fraction *result3 = [mynumber1 chuFun:mynumber2];
        Fraction *result4 = [mynumber1 jianFun:mynumber2];
        
        NSLog(@"乘结果是:%ld / %ld",result.numerator,result.denominator);
        NSLog(@"加结果是:%ld / %ld",result2.numerator,result2.denominator);
        NSLog(@"除结果是:%ld / %ld",result3.numerator,result3.denominator);
        NSLog(@"减结果是:%ld / %ld",result4.numerator,result4.denominator);
        int a = [mynumber1 comparFun:mynumber2];
        NSLog(@"%d",a);
        
    }
#if 1
    //数组元素有10个字符串，请拼成一个字符串并打印
    //        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"ni",@"shi"@"bu",@"shi",@"mei",@"shi",@"a",@"dui",@"jiu",@"ni", nil];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"ni "];
    [array addObject:@"shi "];
    [array addObject:@"bu "];
    [array addObject:@"shi "];
    [array addObject:@"mei "];
    [array addObject:@"shi "];
    [array addObject:@"le "];
    [array addObject:@"dui "];
    [array addObject:@"jiu "];
    [array addObject:@"ni."];
    NSString *str10 = @"";
    for (int i = 0; i < 10; i++) {
        if (i%1 ==0) {
            str10 = [NSString stringWithFormat:@"%@%@",str10,[array objectAtIndex:i]];
        }
        
    }
    NSLog(@"%@",str10);
    
#endif
    return 0;
}
