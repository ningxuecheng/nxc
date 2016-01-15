//
//  Fraction.h
//  OC03-属性
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property (nonatomic, assign)NSInteger numerator;
@property (nonatomic, assign)NSInteger denominator;

- (instancetype)initWithNumerator:(NSInteger)numerator
                      denominator:(NSInteger)denominator;

+ (instancetype)fractionWithNumerator:(NSInteger)numerator
                          denominator:(NSInteger)denominator;
/** 加法 */

- (Fraction *)sumFun:(Fraction *)num;
/** 减法 */

- (Fraction *)jianFun:(Fraction *)num;

/** 乘法 */
- (Fraction *)addFun:(Fraction *)num;


/** 除法 */
- (Fraction *)chuFun:(Fraction *)num;


/** 约分 */
- (Fraction *)yueFun:(Fraction *)num;

/** 比较两个分数的大小 */

- (NSComparisonResult)comparFun:(Fraction *)frac;







@end
