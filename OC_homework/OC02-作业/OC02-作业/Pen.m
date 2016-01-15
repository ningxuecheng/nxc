//
//  Pen.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Pen.h"

@implementation Pen
-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                       size:(NSInteger)size {

    self = [super init];
    if (self) {
        _name = name;
        _color = color;
        _size = size;
        
    }
    return self;
}
+(instancetype)penWithName:(NSString *)name
                     color:(NSString *)color
                      size:(NSInteger)size {

    Pen *mypen = [[Pen alloc] initWithName:name color:color size:size];
    return mypen;

}


@end
