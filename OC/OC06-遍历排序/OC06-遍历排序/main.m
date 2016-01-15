//
//  main.m
//  OC06-遍历排序
//
//  Created by dllo on 15/12/8.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
  
#pragma mark - 知识点1 for遍历集合
#if 0
    
    NSArray *array = @[@"zhang",@"wang",@"li"];
    
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@",array[i]);
    }
    
    NSDictionary *dic = @{@"name":@"wang",
                          @"age":@"20",
                          @"sex":@"male"};
    
    NSArray *temp = dic.allKeys;
    
    for (int i = 0; i < temp.count; i++) {
        NSLog(@"%@",[dic  objectForKey:temp[i]]);
    }
    
    
    
    NSSet *set = [NSSet setWithObjects:@"beijing",@"dalian",@"shanghai", nil];
    
    
    NSArray *arr = set.allObjects;
    
    for (int i = 0; i < arr.count; i++) {
        NSLog(@"%@",arr[i]);
    }
    
#endif
#pragma mark - 知识点2 NSEnumerator 枚举器
#if 0


    NSArray *arr = @[@"zhao",@"qian",@"sun"];
    
    /** 数组,字典,集合 都有一个枚举器方法,返回的是枚举器对象 */
    
    
    NSEnumerator *enumer = [arr objectEnumerator];
    
    id value = nil;
    
    while (value = [enumer nextObject]) {
        NSLog(@"%@",value);
    }
    
    /** 反向枚举 */
    
    NSEnumerator *reser = [arr reverseObjectEnumerator];
    
    id obj = nil;
    while (obj = [reser nextObject]) {
        NSLog(@"%@",obj);
    }
    
    NSDictionary *dic = @{@"name":@"lili",
                          @"sex":@"male",
                          @"age":@"20"};
    
    NSEnumerator *enumer2 = [dic objectEnumerator];
    id objdic;
    while (objdic = [enumer2 nextObject]) {
        NSLog(@"%@",objdic);
    }
    
    
    
    NSSet *set = [NSSet setWithObjects:@"bejing",@"dalian",@"guangzhou", nil];
    
    NSEnumerator *enuset = [set objectEnumerator];
    
    id objset;
    while (objset = [enuset nextObject]) {
        NSLog(@"%@",objset);
    }
    
#endif
    
    
#pragma mark - 知识点3 for in 遍历集合
    /**
     重点:
     1. 对于数组, forin 枚举的是对象
     2. 对于字典, forin 枚举的是key
     3. 对于集合, forin 枚举的是对象
     */
#pragma mark - 知识点4 数组排序
#if 0
    NSArray *arr = @[@"zhang",@"sun",@"li",@"zhao"];
    
    /**1.创建描述对象*/
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    
    /**2.调用数组的排序方法*/
    NSArray *temp = @[desc];
    
    NSArray *new = [arr sortedArrayUsingDescriptors:temp];
    
    
    /**3.遍历输出数组*/
    for (NSString *str in new) {
        NSLog(@"%@",str);
    }
    
    
    
    Person *per1 = [[Person alloc] initWithName:@"lili" age:20 sex:@"male"];
    Person *per2 = [[Person alloc] initWithName:@"zhangsan" age:30 sex:@"male"];
    Person *per3 = [[Person alloc] initWithName:@"sunming" age:14 sex:@"male"];
    
    Person *per4 = [[Person alloc] initWithName:@"liu" age:14 sex:@"male"];
    
    Person *per5 = [[Person alloc] initWithName:@"zhaowei" age:25 sex:@"male"];
    
    NSArray *arrper = @[per1,per2,per3,per4,per5];
    
    
    /**需求: 按照年龄升序排序,如果年龄相同按照姓名 */
    
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
    NSSortDescriptor *sort2 = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    
    NSArray *newtemp = [arrper sortedArrayUsingDescriptors:@[sort,sort2]];
    
    for (Person *temp in newtemp) {
        NSLog(@"name:%@ age:%ld sex:%@",temp.name,temp.age,temp.sex);
    }
    
#endif
#pragma mark ** sortedArrayUsingSelector **
 
#if 0
    /** 1.数组中都是字符串对象*/
    NSArray *arr = @[@"ning",@"sun",@"li"];
    
    /**
     @parm SEL 方法选择器,@selector(方法名),
               方法的返回值必须是 NSComparisonResult
     注意:此方法是数组中元素的方法
     */
    NSArray *new = [arr sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSString *str in new){
        NSLog(@"%@",str);
    }
    
    /** 2. 数组中都是Person对象,按照name生序排序 */
    
    
    Person *per1 = [[Person alloc] initWithName:@"lili" age:20 sex:@"male"];
    Person *per2 = [[Person alloc] initWithName:@"zhangsan" age:30 sex:@"male"];
    Person *per3 = [[Person alloc] initWithName:@"sunming" age:14 sex:@"male"];
    
    Person *per4 = [[Person alloc] initWithName:@"liu" age:14 sex:@"male"];
    
    Person *per5 = [[Person alloc] initWithName:@"zhaowei" age:25 sex:@"male"];
    
    NSArray *arrper = @[per1,per2,per3,per4,per5];
    
    NSArray *newarr = [arrper sortedArrayUsingSelector:@selector(compareWithNameUp:)];
    
    for (Person *per in newarr) {
        NSLog(@"name%@",per.name);
    }
    
    NSArray *newarr2 = [arrper sortedArrayUsingSelector:@selector(compareWithNameDown:)];
    for (Person *per in newarr2) {
        NSLog(@"name%@",per.name);
    }
    
    
    NSArray *agearr = [arrper sortedArrayUsingSelector:@selector(compareWithAgeUp:)];
    for (Person *per in agearr) {
        NSLog(@"name%@",per.name);
    }
    
#endif
#pragma mark ** - sortedArrayUsingComparator:
#if 0
    NSArray *arr = @[@"bei",@"nan",@"dong"];
    NSArray *new = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
        
    }];
    for (NSString *str in new) {
        NSLog(@"%@",str);
    }
    
    Person *per1 = [[Person alloc] initWithName:@"lili" age:20 sex:@"male"];
    Person *per2 = [[Person alloc] initWithName:@"zhangsan" age:30 sex:@"male"];
    Person *per3 = [[Person alloc] initWithName:@"sunming" age:14 sex:@"male"];
    
    Person *per4 = [[Person alloc] initWithName:@"liu" age:14 sex:@"male"];
    
    Person *per5 = [[Person alloc] initWithName:@"zhaowei" age:25 sex:@"male"];
    
    NSArray *arrper = @[per1,per2,per3,per4,per5];
    
    /** 按照名字生序排序*/
    NSArray *new2 = [arrper sortedArrayUsingComparator:^NSComparisonResult(Person*  _Nonnull obj1, Person*  _Nonnull obj2) {
        return [obj1.name compare:obj2.name];
    }];
    
    for (Person *per in new2) {
        NSLog(@"%@",per.name);
    }
    
    /** 按照age降序*/
    
    NSArray *new3 = [arrper sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Person *per1 = obj1;
        Person *per2 = obj2;
        if (per1.age > per2.age) {
            return NSOrderedAscending;
        }else if (per1.age < per2.age) {
        
            return NSOrderedDescending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    for (Person *per in new3) {
        NSLog(@"%@%ld",per.name,per.age);
    }
#endif
    
#pragma mark - 知识点4 可变数组排序
#if 0
    
    NSMutableArray *marr = @[@"wang",@"zhang",@"li"].mutableCopy;
    
   [marr sortUsingSelector:@selector(compare:)];
    
    for (NSString *str in marr) {
        NSLog(@"%@",str);
    }
#endif
#pragma mark - 时间就是金钱(冒泡排序效率)
    /** API: NSDate */
    
    
    /** 对一百万个样本进行排序, 花费时间 */
    NSMutableArray *marrstr = [NSMutableArray array];
    
    for (int i = 0; i < 1000000; i++) {
        NSString *str = [NSString stringWithFormat:@"%ud",arc4random()];
        [marrstr addObject:str];
    }
    
    NSDate *startdate = [NSDate date];
    
    NSLog(@"%@",startdate);
//    for (int i = 0; i < marrstr.count - 1; i++) {
//        for (int j = 0; j < marrstr.count - 1 - i; j++) {
//            if ([marrstr[j] intValue] >[marrstr[j+1] intValue] ) {
//                [marrstr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
//            }
//        }
//    }
    
    [marrstr sortUsingSelector:@selector(compare:)];
    
    NSDate *enddate = [NSDate date];
     NSLog(@"%@",enddate);
    
    NSLog(@"%lf",[enddate timeIntervalSinceDate:startdate]);
    

   
    
    
    
    
    return 0;
}
