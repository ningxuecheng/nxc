//
//  ModelOfSpInfo.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfSpInfo.h"

@implementation ModelOfSpInfo
- (void)dealloc {
    [_description_s release];
    [_title release];
    [_image_url release];
    [_image_height release];
    [_image_width release];
    [super dealloc];
}
@end
