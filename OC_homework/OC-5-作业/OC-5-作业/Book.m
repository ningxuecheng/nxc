//
//  Book.m
//  OC-5-作业
//
//  Created by dllo on 15/12/4.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)initWithName:(NSString *)name
                       price:(float )price {

    self = [super init];
    if (self) {
        _name = name;
        _price = price;
    }

    return self;

}

- (void)info {

    NSLog(@"name:%@",self.name);


}




@end
