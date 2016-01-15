//
//  Zombie.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie


- (void) setXueliang:(NSInteger)xueliang {

    _xueliang = xueliang;


}
- (NSInteger)xueliang {

    return _xueliang;
}


- (void) setShixue:(NSInteger)shixue {

    _shixue = shixue;

}
- (NSInteger)shixue {

    return _shixue;
}


- (instancetype)initWithXueliang:(NSInteger)xueliang
                          shixue:(NSInteger)shixue {

    self = [super init];
    if (self) {
        _xueliang = xueliang;
        _shixue = shixue;
    }
    return self;
}

+ (instancetype)zombieWithXueliang:(NSInteger)xueliang
                            shixue:(NSInteger)shixue {

    Zombie *onez = [[Zombie alloc] initWithXueliang:xueliang shixue:shixue];
    return onez;

}



































@end
