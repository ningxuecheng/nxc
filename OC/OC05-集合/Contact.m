//
//  Contact.m
//  OC05-集合
//
//  Created by dllo on 15/12/4.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Contact.h"

@implementation Contact
- (instancetype)initWithName:(NSString *)name
                       Phnum:(NSString *)phnum {
   
    self = [super init];
    if (self) {
        _name = name;
        _phnum = phnum;
        
        
        /** 根据名字可以得到组名  */
        _group = [name substringToIndex:1].uppercaseString;
        
    }
    return self;

}

- (void)info {

    NSLog(@"name:%@ phone:%@ add:%@ group:%@",_name,_phnum,_address,_group);



}
@end
