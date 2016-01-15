//
//  Person.m
//  OC02-方法
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@implementation Person


/** 实现方法 */

- (instancetype)initWithName:(NSString *)name {
    
    self = [super init]; //指当前类的对象
    if (self) {
        _name = name;
    }
    return self;
    
}

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                         sex:(NSString *)sex {
    
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _sex = sex;
    }
    
    return self;
}





//便利构造器实现
+ (instancetype)personWithName:(NSString *)name
                           sex:(NSString *)sex
                           age:(NSInteger)age {


    Person *per = [[Person alloc] initWithName:name age:age sex:sex];
    return per;

}

+ (instancetype)person {
    Person *per = [[Person alloc] init];
    return per;

}





-(void) personInfo {

    NSLog(@"姓名:%@ 年龄:%ld 性别:%@",_name,_age,_sex);

}
- (void) setName:(NSString *)name {

    _name = name;
}
- (NSString *)name {

    return _name;

}

- (void)setAge:(NSInteger)age {

    _age = age;
}
- (NSInteger)age {

    return _age;

}
- (NSString *)sex {

    return _sex;
}

- (void)setSex:(NSString *)sex {
    _sex = sex;

}


-(void)studyPer {
    NSLog(@"我要学习!");
  
}







@end
