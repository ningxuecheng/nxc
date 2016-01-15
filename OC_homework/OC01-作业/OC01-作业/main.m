//
//  main.m
//  OC01-作业
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "kaiClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyClass *class1 = [[MyClass alloc] init];
        
        class1->_name = @"教室1";
        class1->_height = 200;
        class1->_width = 100;
        class1->no = 123456;
        class1->number = 50;
        
        [class1 information];
        [class1 saySize];
        
        Car *mycar1 = [[Car alloc] init];
        mycar1->_name = @"lobojini";
        mycar1->_color = @"yellow";
        mycar1->_no = 123456;
        mycar1->_type = @"poche";
        
        [mycar1 carIformation];
        [mycar1 carMy];
        
        Student *stu1 = [[Student alloc] init];
        stu1->_name = @"xiaoming";
        stu1->_card = 123456;
        stu1->_age = 20;
        stu1->_sex = 'm';
        [stu1 stuInfor];
        [stu1 stuMy];
        
        
        LOClassF *lanou = [[LOClassF alloc] init];
        lanou->_name = @"蓝欧科技";
        lanou->_className = @"大连1511";
        lanou->_teacherName = @"曹源";
        lanou->num = 25;
        lanou->_date = @"2015.12.1";
        
        [lanou classInfo];
        [lanou activiClass];
        [lanou beginClass];
        Teacher *caolao = [[Teacher alloc] init];
        caolao->_name = @"曹源";
        caolao->_age = 33;
        caolao->_sex = 'm';
        caolao->_subject = @"c/oc";
        [caolao jieShao];
        
        
        Students *newstu1 = [[Students alloc] init];
        Students *newstu2 = [[Students alloc] init];
        Students *three = [[Students alloc] init];
        
        newstu1->_name = @"张三";
        newstu1->_hobby = @"唱歌";
        newstu1->_age = 25;
        newstu1->_sex = 'm';
        newstu1->_sNo = 01;
        
        newstu2->_name = @"王五";
        newstu2->_age = 20;
        newstu2->_sex = 'm';
        newstu2->_sNo = 02;
        newstu2->_hobby = @"lol";
        
        three->_name = @"小红";
        three->_age = 18;
        three->_hobby = @"唱歌";
        three->_sex = 's';
        three->_sNo = 03;
        
        
        [newstu1 jieStu];
        [newstu2 jieStu];
        [three jieStu];
        
    }
    return 0;
}
