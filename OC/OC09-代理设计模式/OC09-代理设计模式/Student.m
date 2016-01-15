//
//  Student.m
//  OC09-代理设计模式
//
//  Created by dllo on 15/12/11.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Student.h"

@implementation Student
/** 实现协议方法 **/

- (void)takecareChild {
  
    NSLog(@"逗小孩玩");
}

- (void)cooking {

    NSLog(@"西红柿鸡蛋");
}
- (void)washing {
  
    NSLog(@"洗刷刷");

}
@end
