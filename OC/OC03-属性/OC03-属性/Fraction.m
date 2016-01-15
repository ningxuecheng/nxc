//
//  Fraction.m
//  OC03-属性
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
- (instancetype)initWithNumerator:(NSInteger)numerator
                      denominator:(NSInteger)denominator {

    self = [super init];
    if (self) {
        _numerator = numerator;
        _denominator = denominator;
        
    }
    return self;
}

+ (instancetype)fractionWithNumerator:(NSInteger)numerator
                          denominator:(NSInteger)denominator {


    Fraction *num = [[Fraction alloc] initWithNumerator:numerator denominator:denominator];
    return num;

}


/** 加法 */
/**int a = 0 ,b = 0,c = 0,d = 1,a1 = 0, b1 = 0;
 printf("请输入两个数:\n");
 scanf("%d%d",&a,&b);
 a1 = a;
 b1 = b;
 while (0 != a % b ) {
 c = a % b;
 a = b ;
 b = c ;
 }
 if (c == 0) {
 d = a;
 printf("最大公约数数是:%d\n",b);
 }else{
 d = a1 * b1 / c;
 printf("最大公约数数是:%d\n",c);
 }
 printf("最小公倍数是:%d\n",d);*/



- (Fraction *)sumFun:(Fraction *)num {
    Fraction *num1 = [[Fraction alloc] init];
    if (num.denominator == self.denominator) {
         num1.numerator =  self.numerator + num.numerator;
        num1.denominator = num.denominator;
    }else {
    
        num1.denominator = num.denominator * self.denominator;
        num1.numerator = num.denominator * self.numerator + num.numerator * self.denominator;
     
    }
    [num1 yueFun:num1];
    return num1;

}
/** 减法 */
- (Fraction *)jianFun:(Fraction *)num {
    Fraction *num1 = [[Fraction alloc] init];
    if (num.denominator == self.denominator) {
        num1.numerator =  self.numerator - num.numerator;
        num1.denominator = num.denominator;
    }else {
        
        num1.denominator = num.denominator * self.denominator;
        num1.numerator = num.denominator * self.numerator - num.numerator * self.denominator;
        
    }
    [num1 yueFun:num1];

   
    return num1;
    
 
}
/** 乘法 */
- (Fraction *)addFun:(Fraction *)num {
 Fraction *num1 = [[Fraction alloc] init];
    num1.denominator = self.denominator * num.denominator;
    num1.numerator = self.numerator * num.numerator;
    [num1 yueFun:num1];
    return num1;

}
/** 除法 */
- (Fraction *)chuFun:(Fraction *)num {
 Fraction *num1 = [[Fraction alloc] init];
    num1.numerator = self.numerator * num.denominator;
    num1.denominator = self.denominator * num.numerator;
    [num1 yueFun:num1];
    return num1;

}
/** 约分 */
- (Fraction *)yueFun:(Fraction *)num {
    /**int a = 0 ,b = 0,c = 0,d = 1,a1 = 0, b1 = 0;
     printf("请输入两个数:\n");
     scanf("%d%d",&a,&b);
     a1 = a;
     b1 = b;
     while (0 != a % b ) {
     c = a % b;
     a = b ;
     b = c ;
     }
     if (c == 0) {
     d = a;
     printf("最大公约数数是:%d\n",b);
     }else{
     d = a1 * b1 / c;
     printf("最大公约数数是:%d\n",c);
     }
     printf("最小公倍数是:%d\n",d);*/
    NSInteger a = 0 ,b = 0,c = 0,d = 1,a1 = 0, b1 = 0;
    a1 = num.numerator;
    a = num.numerator;
    b1 = num.denominator;
    b = num.denominator;
    while (0 != a % b ) {
        c = a % b;
        a = b ;
        b = c ;
    }
    if (c == 0) {
        d = a;
        num.numerator = num.numerator / b;
        num.denominator = num.denominator / b;
        return num;
        
    }else{
        d = a1 * b1 / c;
        num.numerator = num.numerator / c;
        num.denominator = num.denominator / c;
        return num;
       
    }
    return num;
}
/** NSComparisonResult 返回值类型是枚举值 在oc比较方法中,经常用到的一个类型
    里面有3个值,-1,0,1 */
- (NSComparisonResult)comparFun:(Fraction *)frac {

    Fraction *newfra = [self jianFun:frac];
    if (newfra.numerator * newfra.denominator > 0) {
        return NSOrderedDescending; //NSOrderedDescending 降序 1
    }else if (newfra.numerator * newfra.denominator < 0) {
    
        return NSOrderedAscending; //NSOrderedAscending 升序 -1
    }else {
        return NSOrderedSame; //NSOrderedSame 相等 0
    }
  

 
}



























@end
