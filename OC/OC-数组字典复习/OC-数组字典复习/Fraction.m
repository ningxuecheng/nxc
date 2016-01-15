//
//  Fraction.m
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (instancetype)initWithNum:(NSInteger)num
                       deno:(NSInteger)deno {


    self = [super init];
    if (self) {
        _num = num;
        _deno = deno;
    }
    return self;
}

- (Fraction *)addFun:(Fraction *)fra {

    Fraction *add = [[Fraction alloc] init];
    
    add.deno = self.deno * fra.deno;
    add.num =  self.num * fra.deno + fra.num * self.deno;
    
    return add;

}

@end
