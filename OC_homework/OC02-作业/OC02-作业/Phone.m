//
//  Phone.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Phone.h"

@implementation Phone
-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                       type:(NSString *)type {

    self = [super init];
    if (self) {
        _name = name;
        _color = color;
        _type = type;
    }
    return self;
}
+(instancetype)phoneWithName:(NSString *)name
                       color:(NSString *)color
                        type:(NSString *)type {

    Phone *myphone = [[Phone alloc] initWithName:name color:color type:type];
    return myphone;
}


@end
