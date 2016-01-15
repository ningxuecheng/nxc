//
//  Fraction.h
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property(nonatomic, assign)NSInteger num;
@property(nonatomic, assign)NSInteger deno;


- (instancetype)initWithNum:(NSInteger)num
                       deno:(NSInteger)deno;

- (Fraction *)addFun:(Fraction *)fra;


@end
