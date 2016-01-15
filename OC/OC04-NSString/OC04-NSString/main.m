//
//  main.m
//  OC04-NSString
//
//  Created by dllo on 15/12/3.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   
       
#pragma mark - 知识点1 不可变字符串
        /** Class: NSString */
#pragma mark ** 创建对象相关API
#if 0
    /** 字面量方式,创建字符串对象,最常用方法 */
    NSString *str2 = @"iphone";
        
    NSString *str = [[NSString alloc] initWithString:str2];
    NSLog(@"str2:%@ str:%@ ",str2,str);
    
    
    /** 带Format阐述方法,比较灵活(万能方法),可以将任意内容以格式化方法生成字符串对象*/
    NSString *str3 = [[NSString alloc] initWithFormat:@"新建字符串,%@",str];
    
    
    NSLog(@"%@",str3);
    
    
    int a = 123456;
    NSString *str4 = [[NSString alloc] initWithFormat:@"%d",a ];
    NSLog(@"str4:%@",str4);
    
    
    
    /***/
    NSString *str5 = [NSString stringWithString:str4];
    NSLog(@"%@",str5);
    
    
    
    NSString *str6 = [NSString stringWithFormat:@"sda"];
    NSLog(@"%@",str6);
#pragma mark ** 获取字符串长度 API
    
    NSString *str7 = @"asd";
    
    NSLog(@"%ld",str7.length); //长度
#pragma mark ** 直接获取某一个字符(知道index) API
    
    /** 取出字符下表*/
   unichar c = [str characterAtIndex:2]; //
    
    NSLog(@"%c",c);
    
#pragma mark ** 判断两个字符串是否相等 API
    NSString *str1 = @"iphone";
    NSString *str2 = @"iPhone";
    if ([str1 isEqualToString:str2]) {
        NSLog(@"1");
    } else{
        NSLog(@"0");
    }
    
#pragma mark ** 直接比较两个字符串
    NSString *str1 = @"zhangsan";
    NSString *str2 = @"zhangxiaoming";
    NSLog(@"%ld",[str1 compare:str2]);
#pragma mark ** 直接获取一个字符串中某个部分(子字符串)相关 API
    NSString *str = @"i have an iphone6s";
    
    
    /** 取出 i */
    NSString *cut = [str substringToIndex:1];
    NSLog(@"%@",cut);
   /** 取出 6s*/
    NSRange range = {2,4};
    
    cut = [str substringFromIndex:10];
    NSLog(@"%@",cut);
    cut = [str substringWithRange:range];
    NSLog(@"%@",cut);
    
    
    /** 取出 an */
    NSRange range2 = [str rangeOfString:@"an"];
    cut = [str substringWithRange:range2];
    NSLog(@"%@",cut);

    
#pragma mark ** 拼接 API
    NSString *str1 = @"iphone";
    NSString *str2 = @"ipd5";
   NSString *str3 =  [str1 stringByAppendingString:str2];
    NSLog(@"%@",str3);
    
    NSString *str4 = [str1 stringByAppendingFormat:@"6s"];
    NSLog(@"%@",str4);

    
#pragma mark ** 将一个字符串中的某个字符串替换成 其他字符 API
    
    
    NSString *str = @"i have an iphone";
    NSString *str2 = @"xiaomi";
    str = [str stringByReplacingOccurrencesOfString:@"iphone" withString:str2];
    NSLog(@"str:%@",str);
    
#pragma mark ** 字符串转换成int类型 API
    
   NSString *str = @"123456";
    
    NSLog(@"%d",str.intValue);
    
    int a = 123456;

#pragma mark ** 对字符串进行大小写转换 (CASE)
    
   NSString *str = @"asdSAA asda";
    
   str = [str lowercaseString];
    str = str.lowercaseString;
    
    NSLog(@"%@",str);
    
    str = [str uppercaseString];
    str = str.uppercaseString;
    NSLog(@"%@",str);
    
    
    /** 首字母大写 */
    str = str.capitalizedString;
    
    NSLog(@"%@",str);
    
    /** 将姓名的首字母提取出来并且转换为大写字母   */
    
    NSString *name = @"zhangsan";
    
    NSString *substr = [name substringToIndex:1];
    substr = substr.uppercaseString;
    NSLog(@"%@",substr);

    
#pragma mark ** 字符串是否已***开头 或结尾
    
    NSString *str = @"Http://www.baidu.com";
    str = str.lowercaseString;
    if ([str hasPrefix:@"http"]) {
        NSLog(@"1");
    }
    if ([str hasSuffix:@".com"]) {
        NSLog(@"1");
    }
    /** 判断上述字符串中是否以“png”结尾，如果是就替换成“jpg”，如果不是，就拼接”.jpg”。
     */
    NSString *myjpg = @"http://www.lanou3g.com/icon.png";
    if ([myjpg hasSuffix:@"png"]) {
       myjpg = [myjpg stringByReplacingOccurrencesOfString:@"png" withString:@"jpg"]; //myjpg 指针 指向了 新的 位置
    } else{
    
        myjpg = [myjpg stringByAppendingString:@".jpg"];
        
    
    }
    NSLog(@"%@",myjpg);
#endif
#if 0
#pragma mark - 知识点2 可变字符串
    /** 是 NSString 的子类继承了所有的方法和属性
        可变,意味着自身的长度和内容是动态的(可以变化的)*/
    
#pragma mark ** 创建对象相关API

    NSMutableString *mstr = [[NSMutableString alloc] initWithString:@"iphone"];
    
    NSMutableString *mstr2 = [NSMutableString stringWithString:@"6plus"];
    NSMutableString *mstr3 = [NSMutableString stringWithFormat:@"%@",mstr];
    
#pragma mark ** 拼接
    
    
    [mstr appendString:mstr2];
    NSLog(@"%@",mstr);
    

    
#pragma mark ** 删除 替换 插入 一个范围内的字符 API
    
    NSMutableString *str = [NSMutableString stringWithString:@"http://www.baidu.com"];
    
    
    /** 删除 http//*/
    
 //   [str deleteCharactersInRange:[str rangeOfString:@"http://"]];
  //  NSLog(@"%@",str);
    
    
    [str insertString:@"s" atIndex:4];
    
    
    [str replaceCharactersInRange:[str rangeOfString:@".com"] withString:@".cn"];
    
   
    NSLog(@"%@",str);
  
    
    NSRange range = [str rangeOfString:@"baidu"];
    [str insertString:@"?" atIndex:range.length + range.location];
    NSLog(@"%@",str);
    
    
    NSMutableString *mystr1 = [NSMutableString stringWithFormat:@"i have an iphone"];
    [mystr1 replaceCharactersInRange:[mystr1 rangeOfString:@"iphone"] withString:@"xiaomi"];
    
    NSLog(@"%@",mystr1);
    

#pragma mark ** 重置字符串
    
    NSMutableString *mystr1 = [NSMutableString stringWithFormat:@"iOS"];
    [mystr1 setString:@"IPHONE"];
    NSLog(@"%@",mystr1);

    
    
#pragma mark - 知识点3 NSNumber
    /** class: NSNumber 
        此类的作用: 基本数据类型和OC对象进行相互转换
     */
    
    /** 创建对象*/
    NSNumber *num1 = [NSNumber numberWithInt:38];
    NSLog(@"%@",num1);
    
    int a = 100;
    NSNumber *num2 = [NSNumber numberWithInt:a];
    
    NSLog(@"%@",num2);
    
    NSString *str = [NSString stringWithFormat:@"%d",a];
    NSLog(@"%@",str);
    
    NSNumber *num3 = @30;
    NSNumber *num4 = @(a);
    
    /** 从NSNumber 转换为基本类型*/
    NSLog(@"%d",num1.intValue);
    
    /** NSNumber 之间的比较 */
    [num3 compare:num4]; //对象比较
    
    NSLog(@"%ld",[num3 compare:num4]);
    
#endif
    
#pragma mark - 知识点4 NSValue
    
    /** 类NSValue 
        作用: 将结构体和对象类型进行互转 
     
     */
    
    NSRange range = {3,4};
    /** 创建对象 */
    NSValue *val = [NSValue valueWithRange:range];
    
    NSLog(@"%@",val);
    
    /** 转换结构体 */
    NSRange new = val.rangeValue;

    NSLog(@"%ld %ld",new.location,new.length);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    return 0;
}
