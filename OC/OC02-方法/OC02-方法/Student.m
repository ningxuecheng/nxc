//
//  Student.m
//  OC02-方法
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Student.h"

@implementation Student


/** 重写父类方法 */

-(void)studyPer {
    
   
    [super studyPer];
    //super 编译器指令 不是对象 给super是调用父类中此方法的实现
    
    NSLog(@"数学!");
    
}



- (void) setSchool: (NSString *)school {
    _school = school;

}
- (NSString *)school {

    return _school;
}

-(void) setNumber: (NSInteger)number {

    _number = number;

}
-(NSInteger)number {
    return _number;

}


-(instancetype)initWithName:(NSString *)name
                        age:(NSInteger)age
                        sex:(NSString *)sex
                     school:(NSString *)school
                     number:(NSInteger)number {

    self = [super initWithName:name age:age sex:sex];
    if (self) {
        _number = number;
        _school = school;
    }
    
    
    return self;

}













@end
