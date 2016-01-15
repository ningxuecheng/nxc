//
//  Person.m
//  oc08-lianxineicun
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)dealloc {

    [_name release];
    [super dealloc];

}

@end
