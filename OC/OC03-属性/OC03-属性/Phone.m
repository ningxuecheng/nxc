//
//  Phone.m
//  OC03-属性
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Phone.h"

@implementation Phone
-(instancetype)initWithLog:(NSString *)log
                      size:(float)size
                      color:(NSString *)color {

    self = [super init];
    if (self) {
        _log = log;
        _size = size;
        _color = color;
    }
    return self;

}
+(instancetype)phoneWithlog:(NSString *)log
                       size:(float)size
                       color:(NSString *)color {

    Phone *mypho = [[Phone alloc] initWithLog:log size:size color:color];
    return mypho;

}

- (void)callPhone {

    NSLog(@"打电话");

}
@end
