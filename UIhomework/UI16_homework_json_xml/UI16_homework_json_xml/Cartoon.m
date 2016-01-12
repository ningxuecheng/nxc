//
//  Cartoon.m
//  UI16_homework_json_xml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Cartoon.h"

@implementation Cartoon

- (void)dealloc {
    [_desc release];
    [_name release];
    [super dealloc];
}
@end
