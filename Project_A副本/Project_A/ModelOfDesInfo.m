//
//  ModelOfDesInfo.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfDesInfo.h"

@implementation ModelOfDesInfo

- (void)dealloc {
    [_id release];
    [_entry_id release];
    [_tips release];
    [_lat release];
    [_lng release];
    [_image_url release];
    [_entry_name release];
    [_attraction_type release];
    [super dealloc];
}

@end
