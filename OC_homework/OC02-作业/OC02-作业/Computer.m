//
//  Computer.m
//  OC02-作业
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Computer.h"

@implementation Computer
-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                      price:(float)price {
    self = [super init];
    if (self) {
        self.name = name;
        self.color = color;
        self.price = price;
    }
    return self;

}
+(instancetype)computerWithName:(NSString *)name
                          color:(NSString *)color
                          price:(float)price {

    Computer *comp1 = [[Computer alloc] initWithName:name color:color price:price];
    return comp1;

}


@end
