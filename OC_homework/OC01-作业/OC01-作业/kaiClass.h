//
//  kaiClass.h
//  OC01-作业
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 作业2  完成蓝欧班级开班仪式流程
 1.早上9.30开班仪式开始.(NSLog(@"开班仪式正式开始"))
 2.刘辉老师做自我介绍.
 3.三名学生做自我介绍
 需求:
 (1)定义一个班级类(LOClassF)
 实例变量:所属培训机构名称、班级名、班级人数、授课老师名字、开班日期.
 方法:初始化(设置学校名字:蓝欧)、集体活动、开班仪式。
 (2)定义一个老师类
 实例变量:名字、性别、年龄、正在教的课程。
 方法:初始化、讲课、布置、验收作业、解决问题、自我介绍。
 (3)定义一个学生类。
 实例变量:姓名、性别、年龄、学号。
 方法:初始化、学习、做作业、提出问题、回答问题、自我介绍。
 注:方法以NSLog输出为主
 
 */

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
//方法:初始化、讲课、布置、验收作业、解决问题、自我介绍。
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








