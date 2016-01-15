//
//  Person.m
//  OC01-类和对象
//
//  Created by dllo on 15/11/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"


/** .m文件实现方法
     ,h中声明的方法,在.m中必须实现
 方法的实现是在相应的 @implementation 和 @end之间
 */

@implementation Person

- (void)sayHello {

    NSLog(@"hello!"); //NSLog oc中的输出函数 注意()里面@""开头 输出""之间的内容,会在之后自动加一个换行

}
- (void)inforOfPerson:(Person *)person {

    NSLog(@"name: %@, age: %d, number: %ld, weight:%.2f",person->_name,person->_age,person->_number,person->_weight);
}
-(void)information {
    
    NSLog(@"name: %@,age:%d,number:%ld,weight:%.2f",_name,_age,_number,_weight);
}

@end
