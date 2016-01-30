//
//  ModelOfGuInfo.m
//  Project_A
//
//  Created by dllo on 16/1/28.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfGuInfo.h"

@implementation ModelOfGuInfo
- (void)dealloc {
    [_id release];
    [_title release];
    [_sections release];
    [super dealloc];
}

- (instancetype)initWithArr {
    self = [super init];
    if (self) {
        self.sections = [NSArray array];
    }
    return self;

}
@end
