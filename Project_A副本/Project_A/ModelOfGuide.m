//
//  ModelOfGuide.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfGuide.h"

@implementation ModelOfGuide

- (void)dealloc {
    [_id release];
    [_children release];
    [_title release];
    [super dealloc];
}


- (instancetype)initWithArr {
    self = [super init];
    if (self) {
        self.children = [NSArray array];
    }
    return self;
}

@end
