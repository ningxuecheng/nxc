//
//  MyClass.h
//  OC01-作业
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 作业1  定义10个类:
 1、声明:实例变量、方法。实现:初始化方法、自定义方法、自我介绍方法。(方法实现时，以NSLog输出即可)
 2、在main.m中分别创建10个类的对象。
 3、给对象的实例变量进行赋值、取值操作，执行方法。
 
 */
@interface MyClass : NSObject
{
    @public
    NSString *_name;
    float _width;
    float _height;
    int  number;
    NSInteger no;
}

- (void)saySize;
- (void)information;
@end

@interface Car : NSObject
{
    @public
    NSString *_name;
    NSInteger _no;
    NSString *_color;
    NSString *_type;
}
-(void) carIformation;
-(void) carMy;
@end

@interface Student : NSObject
{
   @public
    NSString *_name;
    NSInteger _card;
    int _age;
    char _sex;
}
-(void) stuInfor;
-(void) stuMy;
@end


@interface kaiClass : NSObject
{}

@end


@interface LOClassF : NSObject

{   @public
    NSString *_name;
    NSString *_className;
    int num;
    NSString *_teacherName;
    NSString *_date;
}
-(void) classInfo;
-(void) activiClass;
-(void) beginClass;
@end

@interface Teacher : NSObject
{
@public
    NSString *_name;
    char _sex;
    int _age;
    NSString *_subject;
}

-(void) jiangKe;
-(void) buZhi;
-(void) yanShou;
-(void) jieJue;
-(void) jieShao;
@end

@interface Students : NSObject
{
@public
    NSString *_name;
    char _sex;
    int _age;
    int _sNo;
    NSString *_hobby;
    
}
-(void) jieStu;
@end

@interface Ball : NSObject
{}

@end


@interface Home : NSObject

{   @public
    NSString *_name;
    NSString *_className;
    int num;
    NSString *_teacherName;
    NSString *_date;
}
-(void) classInfo;
-(void) activiClass;
-(void) beginClass;
@end

@interface Teachers : NSObject
{
@public
    NSString *_name;
    char _sex;
    int _age;
    NSString *_subject;
}
-(void) jiangKe;
-(void) buZhi;
-(void) yanShou;
-(void) jieJue;
-(void) jieShao;
@end

@interface Works : NSObject
{
@public
    NSString *_name;
    char _sex;
    int _age;
    int _sNo;
    NSString *_hobby;
    
}
-(void) jieStu;
@end
























