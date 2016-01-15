//
//  ModZom.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Zombie.h"
@interface ModZom : Zombie

/** 2、定义路障僵尸类：
 实例变量：僵尸总血量、僵尸每次失血量，道具，弱点。
 方法：初始化方法，便利构造器，setter和getter。
 */


{
    NSString *_cloth;
    NSString *_hard;
    
}


- (void) setCloth:(NSString *)cloth;
- (NSString *)cloth;


- (void) setHard:(NSString *)hard;
- (NSString *)hard;

- (instancetype)initWithXueliang:(NSInteger)xueliang shixue:(NSInteger)shixue cloth:(NSString *)cloth
                            hard:(NSString *)hard;
+ (instancetype)zombieWithXueliang:(NSInteger)xueliang shixue:(NSInteger)shixue cloth:(NSString *)cloth hard:(NSString *)hard;

@end
