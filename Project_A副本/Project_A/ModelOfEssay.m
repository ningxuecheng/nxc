//
//  ModelOfEssay.m
//  Project_A
//
//  Created by dllo on 16/1/29.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfEssay.h"

@implementation ModelOfEssay

- (void)dealloc {
    [_description_s release];
    [_entry_name release];
    [_entry_type release];
    [_attraction_type release];
    [_image_height release];
    [_image_width release];
    [_url release];
    [_col release];
    [super dealloc];
}

@end
