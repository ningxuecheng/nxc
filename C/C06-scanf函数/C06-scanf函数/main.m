//
//  main.m
//  C06-scanf函数
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   
    int a = 0, b = 0;
    char c = 0;
    
    printf("请输入整数a:\n");
    rewind(stdin);  //清空输入缓存流
    scanf("%d",&a);
    
    printf("请输入整数b:\n");
    rewind(stdin);
    scanf("%d",&b);
    
    printf("请输入字符c:\n");
    rewind(stdin);
    scanf("%c",&c);
    
    
    
    printf("a: %d\n b: %d\n c: %c",a,b,c);
    
    
    
    
    return 0;
}
