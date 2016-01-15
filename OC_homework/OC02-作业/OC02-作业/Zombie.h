//
//  Zombie.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 1、定义普通僵尸类：
 实例变量：僵尸总血量、僵尸每次失血量。
 方法：初始化方法，便利构造器， setter和getter。
 */
@interface Zombie : NSObject

{
    
    NSInteger _xueliang;
    NSInteger _shixue;
}



- (void) setXueliang:(NSInteger)xueliang;
- (NSInteger)xueliang;


- (void) setShixue:(NSInteger)shixue;
- (NSInteger)shixue;

- (instancetype)initWithXueliang:(NSInteger)xueliang
                          shixue:(NSInteger)shixue;

+ (instancetype)zombieWithXueliang:(NSInteger)xueliang
                            shixue:(NSInteger)shixue;
@end
