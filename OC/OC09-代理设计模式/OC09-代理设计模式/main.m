//
//  main.m
//  OC09-代理设计模式
//
//  Created by dllo on 15/12/11.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mother.h"
#import "Teacher.h"
#import "Student.h"
#import "Doctor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#pragma mark - 知识点1 代理设计模式
        
    /** 场景:
     *
     * 委托人: 母亲对象
     * 受委托人: 教师对象 学生对象 医生对象
     * 协议: 1.看小孩 2.做饭 3.洗衣服
     *
     *
     * 母亲对像 最重要制定一个delegate 代理人
     * 当母亲对象 执行付款方法时, 代理人开始执行协议中的方法
     
     
     */
        
        
        Mother *mother = [[Mother alloc] initWithName:@"Marry"];
        
        Teacher *teacher = [[Teacher alloc] initWithName:@"Mr."];
        Student *student = [[Student alloc] initWithName:@"xiaoming"];
        Doctor *doc = [[Doctor alloc] initWithName:@"zhangsan"];
        
        /** 第一步: 母亲声明协议, 详见mother.h文件. */
        
       /** 第二部: 母亲要声明一个delegate属性 目的是以后指定代理人(赋值).
                  详见mother.h文件
           
        */
        
       /** 第三部: 教师, 学生, 医生 签订协议 */
        /** 第四部: 母亲选定一个代理人 */
        mother.delegate = student;
        
        /** 第五部: 代理人实现方法. 详见student.m 文件 **/
        /** 第六步: 在适当的时机, 代理人调用协议方法(即看小孩 做饭 洗衣服)
                   选中方法, 母亲付钱, 代理人执行操作
         *  详见mother.h文件 paymoney方法
         */
        
        
        [mother payMoney];
        
        
    }
    return 0;
}
