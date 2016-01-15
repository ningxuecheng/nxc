//
//  Contact.m
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Contact.h"

@implementation Contact
- (instancetype)initWName:(NSString *)name
                    phone:(NSString *)phone
                  address:(NSString *)add {

    self = [super init];
    if (self) {
        _name = name;
        _phone = phone;
        _address = add;
        _group = [name substringToIndex:1].uppercaseString;
        
    }
    return self;
}

@end
