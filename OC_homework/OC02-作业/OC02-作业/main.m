//
//  main.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Zombie.h"
#import "ModZom.h"
/**作业2: 僵尸作业。需求：
 1、定义普通僵尸类：
 实例变量：僵尸总血量、僵尸每次失血量。
 方法：初始化方法，便利构造器， setter和getter。
 2、定义路障僵尸类：
 实例变量：僵尸总血量、僵尸每次失血量，道具，弱点。
 方法：初始化方法，便利构造器，setter和getter。
 3、在main.m中创建普通僵尸对象、路障僵尸对象。*/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Zombie *one = [Zombie zombieWithXueliang:1000 shixue:100];
        [one setXueliang:2000];
        
        Zombie *two = [[Zombie alloc] initWithXueliang:2000 shixue:100];
        NSLog(@"血量:%ld,失血:%ld",[one xueliang],[one shixue]);
        
        ModZom *modone = [ModZom zombieWithXueliang:1000 shixue:10 cloth:@"aaa" hard:@"bbb"];
        ModZom *modtwo = [[ModZom alloc] initWithXueliang:2000 shixue:100 cloth:@"sss" hard:@"ddd"];
        
       
        
        
        
        
        
    }
    return 0;
}
