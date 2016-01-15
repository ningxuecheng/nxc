//
//  main.m
//  OC05-集合
//
//  Created by dllo on 15/12/4.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

int main(int argc, const char * argv[]) {
  
#pragma mark - 知识点1 数组
#pragma mark * 不可变数组
#pragma mark * 创建对象 API
#if 0
    NSArray *array = [[NSArray alloc]  initWithObjects:@"beijing",@"haerbin", nil];
    
    NSArray *array2 = [NSArray arrayWithObjects:@"dalian",@"shenyang", nil];
    
    /** 字面量 */
    NSArray *array3 = @[@"beijing", @"dalian"];
    

    
#pragma mark * 获取数组元素个数
    NSArray *array = @[@"beijing", @"dalian",@"jinzhou"];
    
    NSLog(@"%ld",array.count);

#pragma mark * 根据元素下标 获取元素(对象) API
    
    NSArray *array = @[@"beijing", @"dalain", @"jinzhou"];
    
    
    /** 注意:从数组中 获取对象时一定要明确对象类型 */
    NSString *city = [array objectAtIndex:2];
    
    /** 字面量 方式获取对象*/
    
    NSString *name =  array[2];
    NSLog(@"%@ %@",name,city);


    
#pragma mark * 用来判断数组中是否包含某一个给定的对象 API
    
    NSArray *array = @[@"beijing", @"dalian", @"haerbin"];
    
   BOOL arr = [array containsObject:@"beijing"];
    
    NSLog(@"%d",arr);
    

    
#pragma mark * 获取数组元素对应的索引 API
    
    NSArray *array = @[ @"dalian",@"beijing", @"henan"];
    
    NSUInteger a = [array indexOfObject:@"beijing"];
    NSLog(@"%ld",a);

    
#pragma mark * 按照给定的字符串进行截取，将截取的多段字符串放入数组中 API
    
    NSString *str = @"www.baidu.com";
    
    
    /** 注意这是字符串方法 */
    NSArray *array = [str componentsSeparatedByString:@"."];
    
    NSLog(@"arr:%@",array[1]);

    
#pragma mark * 将数组中的元素按照给定的字符串格式拼接成一个完整的字符串对象 API

    
    NSArray *array = @[@"beijing", @"dalian", @"jinzhou"];
    
    
    /** 注意 这是数组的方法 返回值是字符串 */
   NSString *str = [array componentsJoinedByString:@"&"];
    
    NSLog(@"%@",str);
    
    /**http://www.imanhua.com/Cover/2011-10/hyrz.jpg&http://www.imanhua.com/Cover/2011-09/op.jpg&http://www.imanhua.com/Cover/2012-04/yjdwb.jpg 存在如下的字符串，将其中的图片的网址提取出来。
     */
    
    NSString *new = @"http://www.imanhua.com/Cover/2011-10/hyrz.jpg&http://www.imanhua.com/Cover/2011-09/op.jpg&http://www.imanhua.com/Cover/2012-04/yjdwb.jpg";
     NSArray *newarr =  [new componentsSeparatedByString:@"&"];
    NSLog(@"%@",newarr);
    
    
    /**有如下一个数组，@[@“type = iOS", @"Device = iPhone", @"count = 11344115@163.com", @"password = 12345”]，将其中的内容用”&"符号拼接成一个字符串
     */
    
    NSArray *arr1 = @[@"type = iOS", @"Device = iPhone", @"count = 11344115@163.com", @"password = 12345"];
    
    NSString *arrstr = [arr1 componentsJoinedByString:@"&"];
    NSLog(@"%@",arrstr);
    
#endif
#pragma mark - * 可变数组
#if 0

#pragma mark * 创建对象
    NSMutableArray *marr = [[NSMutableArray alloc] initWithObjects:@"beijing",@"dalian",@"nanjing", nil];
    
    NSMutableArray *marr2 = [NSMutableArray arrayWithCapacity:20];
    
    
    //后面加上 mutableCopy 可以拷贝一份可变的数组
    NSMutableArray *marr3 = @[@"beijing",@"dalian",@"haerbin"].mutableCopy;

#pragma mark * 数组中添加一个对象
    NSMutableArray *marr = @[@"beijing",@"dalian", @"haerbin"].mutableCopy;
    /* 在最后 */
    [marr addObject:@"hangzhou"];
    NSLog(@"%@",marr);
    
    
#pragma mark * 数组中指定位置插入一个对象
    
    [marr insertObject:@"guangzhou" atIndex:1];
    NSLog(@"%@",marr);
    
#pragma mark * 数组中移除一个对象
    [marr removeObject:@"dalian"];
    NSLog(@"%@",marr);

    
#pragma mark * 移除数组中最后一个对象
    NSMutableArray *marr = @[@"dalian",@"beijing", @"hangzhou"].mutableCopy;
    
    [marr removeLastObject];
    NSLog(@"%@",marr);
    
    
#pragma mark * 移除数组中所有的元素
    [marr removeAllObjects];
    NSLog(@"%@",marr);

    
    
#pragma mark * 数组中移除指定位置的元素
    NSMutableArray *marr = @[@"beijing", @"dalian", @"hangzhou"].mutableCopy;
    
    [marr removeObjectAtIndex:1];
    
    NSLog(@"%@",marr);

    
#pragma mark * 使用指定的对象替换指定位置的对象
    NSMutableArray *marr = @[@"beijing", @"dalian", @"hangzhou"].mutableCopy;
    
    [marr replaceObjectAtIndex:1 withObject:@"shanghai"];
    NSLog(@"%@",marr);
    

    
    
#pragma mark * 交换指定的两个下标对应的对象
    NSMutableArray *marr = @[@"beijing", @"dalian", @"hangzhou"].mutableCopy;
    
    
    [marr exchangeObjectAtIndex:0 withObjectAtIndex:2];
    
    
    
    NSLog(@"%@",marr);
    
    
    NSMutableArray *name = @[@"a", @"c"].mutableCopy;
    
    [name insertObject:@"b" atIndex:0];
    NSLog(@"%@",name);
#endif
#pragma mark - 知识点2 字典
#pragma mark * 不可变词典
#pragma mark * 创建对象
#if 0
    /** 注意key 和 value 的顺序 
         先 值 后 key
     */
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"zhangsan",@"name",@"20",@"age",@"male",@"sex", nil];
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"lisi",@"name",@"20",@"age",@"male",@"sex", nil];
    
  
    /** 字面量的写法 */
    
    
    NSDictionary *dic3 = @{@"name":@"zhangsan",
                           @"age":@"20",
                           @"sex":@"male"};
    NSLog(@"%@",dic3);
    
    
    NSLog(@"%@",dic1);
    
    
    
#pragma mark * 获取字典中键值对的个数
    
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"zhangsan",@"name",@"male",@"sex",@"20",@"age", nil];
     NSInteger a = dic4.count;
    
    NSLog(@"%ld",a);
#pragma mark * 获取字典中所有的键
    
   NSArray *arr =  dic4.allKeys;
    NSLog(@"%@",arr);
    
#pragma mark * 根据键获得对应的值
    NSArray *arr2 = dic4.allValues;
    NSLog(@"%@",arr2);
    
    NSString *str = [dic4 objectForKey:@"sex"];
    NSString *str2 = [dic4 valueForKey:@"sex"];
    
    NSLog(@"%@",str);
    NSLog(@"%@",str2);

#pragma mark * 可变字典:
    
    NSMutableDictionary *mdic = @{@"name":@"lisi",
                                  @"age":@"20",
                                  @"sex":@"male"}.mutableCopy;
    
    
    NSMutableDictionary *mdic2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"zhangsan",@"name",@"20",@"age",@"male",@"sex", nil];
    
    NSMutableDictionary *mdic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"wangwu",@"name",@"20",@"age",@"male",@"sex", nil];
    
    
    
    /**  空字典 */
    
    NSMutableDictionary *kong = [NSMutableDictionary dictionary];
    NSMutableDictionary *kong2 = [NSMutableDictionary dictionaryWithCapacity:26];
    
    
    
    
    NSLog(@"%@",mdic2);
    NSLog(@"%@",mdic);
    NSLog(@"%@",mdic3);
#pragma mark * 字典中添加新的键值对以及 修改某一对键值对
    
    [mdic3 setObject:@"running" forKey:@"hobby"];
    
    [mdic3 setObject:@"singsing" forKey:@"hobby"];
    
    

#pragma mark * 移除指定的键对应的键值对
    
    NSMutableDictionary *mdic3 = @{@"name":@"lili",@"sex":@"fmale",@"hobby":@"running"}.mutableCopy;
    
    [mdic3 removeObjectForKey:@"name"];
    
#pragma mark * 移除字典中所有的键值对
    [mdic3 removeAllObjects];
    NSLog(@"%@",mdic3);
 #endif
#pragma mark * 练习:
   
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithCapacity:26];
    
    
   
    for (int i = 0; i < 26; i++) {
        
        /** 创建 key 值 */
        
        
        NSString *key = [NSString stringWithFormat:@"%c",'A' + i];
        /** 创建可变的空数组 */
        NSMutableArray *marr = [NSMutableArray array];
        
        /** 将字典中加入新的键值对 */
        [dic2 setObject:marr forKey:key];
        
        
    }
    
    
   /**2.创建联系人 */
    Contact *con1 = [[Contact alloc] initWithName:@"zhang" Phnum:@"15214442000"];
    Contact *con2 = [[Contact alloc] initWithName:@"Chang" Phnum:@"15214442000"];
     Contact *con3 = [[Contact alloc] initWithName:@"Bhang" Phnum:@"15214442000"];
     Contact *con4 = [[Contact alloc] initWithName:@"Nhang" Phnum:@"15214442000"];
    /**3.根据联系人的分组 在字典中找出对应的数组*/
    
    
    NSString *key = con1.group;
    NSMutableArray *arr = [dic2 objectForKey:key];
    
    [arr addObject:con1];
    
    
    
    [[dic2 objectForKey:con2.group] addObject:con2];
    
    [[dic2 objectForKey:con3.group] addObject:con3];
    [[dic2 objectForKey:con4.group] addObject:con4];
    
    
    
    for (NSString *key in dic2) {
        NSArray *arr = [dic2 objectForKey:key];
        
        for (Contact *con in arr) {
            [con info];
        }
    }
    
    
    
    //NSLog(@"%@",dic2);


#pragma mark - 快速遍历容器 (数组,集合,字典)
    
    /** 遍历数组*/
#if 0
    
    NSArray *array = @[@"zhangsan",@"lisi",@"wangwu"];
    
    
    /** forin 快速遍历 */
    for (NSString *str in array) {
        NSLog(@"%@",str);
    }
    
    NSArray *cintarr = @[con1,con2,con3];
    
    for (Contact *con in cintarr) {
        [con info];
        NSLog(@"%@",con);
     }
    
    

    
    /** 遍历字典 */
    
    
    NSDictionary *dic3 = @{@"name":@"zhangsan",
                           @"age":@"20",
                           @"hobby":@"running",
                           @"sex":@"male"};
    
    
    
    /** 注意:对字典快速遍历,遍历的是key */
    for (NSString *key in dic3) {
        NSLog(@"%@",[dic3 objectForKey:key]);
    }
    
    
    
    

 #endif
#pragma mark - 知识点3 集合
#pragma mark * 不可变集合
#pragma mark * 创建对象
#if 0
    /** 注意: 集合的互异性, 不能存在相同的对象 */
    
    NSSet *set = [[NSSet alloc] initWithObjects:@"zhang",@"wang",@"zhang",@"li", nil];
    NSSet *set2 = [NSSet setWithObjects:@"li",@"wang",@"zhang", nil];
#pragma mark * 个数
    NSLog(@"%ld", set.count);
    
    
#pragma mark * 取出对象
    
    NSLog(@"%@",[set anyObject]);
    
#pragma mark * 取出所有对象
    NSArray *array = [set allObjects];
    
    NSLog(@"%@",array);
#pragma mark * 判断是否含有某个对象
    if ([set containsObject:@"zhang"]) {
        NSLog(@"含有");
        
    }else{
    
        NSLog(@"无");
    }
#endif
#pragma mark - 可变集合
#pragma mark * 创建对象
    
    NSMutableSet *mset = [[NSMutableSet alloc] initWithObjects:@"zhang",@"li",@"wang", nil];
    
    
    NSMutableSet *mset2 = [NSMutableSet setWithObjects:@"beijing",@"nanjing",@"shanghai", nil];
#pragma mark * 添加对象
    
    [mset addObject:@"www"];
    
#pragma mark * 删除对象
    
    [mset removeObject:@"zhang"];
#pragma mark * 移除所有
    
    [mset removeAllObjects];
#pragma mark * 快速遍历集合
    
    for (NSString *str in mset2) {
        NSLog(@"%@",str);
    }
    return 0;
}
