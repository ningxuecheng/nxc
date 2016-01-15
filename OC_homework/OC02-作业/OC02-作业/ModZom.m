//
//  ModZom.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ModZom.h"

@implementation ModZom


- (void) setCloth:(NSString *)cloth {

    _cloth = cloth;

}
- (NSString *)cloth {

    return _cloth;
}


- (void) setHard:(NSString *)hard {

    _hard = hard;
}
- (NSString *)hard {
    
    return _hard;
}

- (instancetype)initWithXueliang:(NSInteger)xueliang
                          shixue:(NSInteger)shixue
                           cloth:(NSString *)cloth
                            hard:(NSString *)hard {

    self = [super initWithXueliang:xueliang shixue:shixue];
    if (self) {
        _hard = hard;
        _cloth = cloth;
    }
    return self;

}
+ (instancetype)zombieWithXueliang:(NSInteger)xueliang shixue:(NSInteger)shixue cloth:(NSString *)cloth hard:(NSString *)hard {

    ModZom *onemod = [[super alloc] initWithXueliang:xueliang shixue:shixue cloth:cloth hard:hard];
    return onemod;

}


@end
