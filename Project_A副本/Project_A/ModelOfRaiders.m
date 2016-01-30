//
//  ModelOfRaiders.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfRaiders.h"

@implementation ModelOfRaiders

- (void)dealloc {
    [_id release];
    [_image_url release];
    [_name_en release];
    [_name_zh_cn release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
