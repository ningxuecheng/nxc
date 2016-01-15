//
//  main.m
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "AddressBook.h"
#import "Contact.h"
#import "AddressBookV2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#pragma mark - 复习1:分数
#if 0
        Fraction *fra1 = [[Fraction alloc] initWithNum:2 deno:5];
        Fraction *fra2 = [[Fraction alloc] initWithNum:1 deno:3];
        
        
        Fraction *new = [fra1 addFun:fra2];
        
        
        NSLog(@"%ld/%ld",new.num,new.deno);
#endif
#pragma mark - 复习:联系人
#if 0
        /** 涉及到两个类:AddressBook 通讯录类
         Contact 联系人类*/
        
        
        AddressBook *book = [[AddressBook alloc] init];
        
        Contact *per1 = [[Contact alloc] init];
        per1.name = @"lili";
        per1.phone = @"123456789";
        per1.address = @"dalian";
        
        Contact *per2 = [[Contact alloc] init];
        per2.name = @"zhangsan";
        per2.address = @"beijing";
        per2.phone = @"789456132";
        
        
        /**手机通讯录方法**/
        
        [book addContact:per1];
        [book addContact:per2];
        
        
        [book listAllContact];
        
        
        NSLog(@"asdad");
        
        
        [book delCon:per1];
        
        [book listAllContact];
#endif
#pragma mark - 中等难度
#if 0
        
        AddressBookV2 *ab2 = [[AddressBookV2 alloc] init];
        
        
        Contact *per1 = [[Contact alloc] initWName:@"lili" phone:@"123456789" address:@"dada"];
        
        
        Contact *per2 = [[Contact alloc] initWName:@"wangwu" phone:@"123534536" address:@"asdad"];
        
        Contact *per3 = [[Contact alloc] initWName:@"liuxing" phone:@"132456789" address:@"dasd"];
        
        [ab2 addContact:per1];
        [ab2 addContact:per2];
        [ab2 addContact:per3];
        
        [ab2 listAllobj];
        
        
        [ab2 listCobj:@"l"];
        
        
        NSLog(@"dasd");
        
#endif
        
#pragma mark - 练习:省市区
        
        NSString *file = [NSString stringWithContentsOfFile:@"/Users/dllo/Desktop/OC/OC-数组字典复习/OC-数组字典复习/area.txt" encoding:NSUTF8StringEncoding error:nil];
        
        //NSLog(@"%@",file);
        
        
        /** 将字符串进行截取 按照\n*/
        NSArray *arr = [file componentsSeparatedByString:@"\n"];
        
        /** 创建中国数组 */
        NSMutableArray *chinaArr = [NSMutableArray array];
        /** 便利数组*/
        
        NSString *provinceName = nil;
        NSString *cityName = nil;
        NSString *areaName = nil;
        
        for (NSString *line in arr ) {
            if (![line hasPrefix:@" "]) {//字符串不是以空格开头,说明是省名
                provinceName = line;  //记录省名
                //创建省字典 加入中国数组中
                NSMutableArray *cityArr = [NSMutableArray array];
                NSMutableDictionary *prodic = [NSMutableDictionary dictionaryWithObjectsAndKeys:provinceName, @"省名",cityArr,@"市", nil];
                [chinaArr addObject:prodic];
                
            }else if (![line hasPrefix:@"    "]){/**说明是市名*/
                cityName = line;  //记录世明
                /** 创建市字典,添加对应省的市数组中 */
                NSMutableArray *areaArr = [NSMutableArray array];
                
                NSMutableDictionary *cityDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:cityName,@"市名",areaArr,@"区", nil];
                
                /** 从中国数组里面 找出对应省的市数组*/
                NSMutableArray *tempArr = [[chinaArr lastObject] objectForKey:@"市"];
                [tempArr addObject:cityDic];
            }
            else {
                areaName = line; //记录区名
                /** 找出区所在省的市数组的相应市的区数组*/
                NSMutableArray *tempArr = [[chinaArr lastObject] objectForKey:@"市"];
                NSMutableArray *tempArr2 = [[tempArr lastObject] objectForKey:@"区"];
                [tempArr2 addObject:areaName];
            }
        }
    }
    
    
    return 0;
}
