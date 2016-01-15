//
//  MyClass.m
//  OC01-作业
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

-(void) information {


    NSLog(@"名字: %@ 号码: %ld",_name,no);

}

-(void) saySize {
    NSLog(@"width: %.2f, height: %.2f",_width,_height);

}
@end

@implementation Car

-(void) carIformation {

    NSLog(@"名字: %@ 号码: %ld 颜色: %@ 型号: %@",_name,_no,_color,_type);
}
-(void) carMy {

    NSLog(@"我的车");
}

@end

@implementation Student

-(void) stuInfor {

    NSLog(@"名字: %@ 学号: %ld 性别: %c 年龄: %d",_name,_card,_sex,_age);
}
-(void) stuMy {

    NSLog(@"sda");
}

@end



















