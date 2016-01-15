//
//  College.m
//  OC02-方法
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "College.h"

@implementation College

- (void)setMajor:(NSString *) major {

    _major = major;

}
- (NSString *)major {

    return _major;
}

- (void)setAcodemy:(NSString *) acodemy {

    _acodemy = acodemy;
}
- (NSString *)acodemy {

    return _acodemy;
}

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                         sex:(NSString *)sex
                      school:(NSString *)school
                      number:(NSInteger)number
                       major:(NSString *)major
                     acodemy:(NSString *)acodemy {
    self = [super initWithName:name age:age sex:sex school:school number:number];
    if (self) {
        _major = major;
        _acodemy = acodemy;
    }
    return self;
}
@end
