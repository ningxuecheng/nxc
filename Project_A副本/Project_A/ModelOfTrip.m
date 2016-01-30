//
//  ModelOfTrip.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfTrip.h"

@implementation ModelOfTrip

- (void)dealloc {
    [_id release];
    [_image_url release];
    [_name release];
    [_plan_days_count release];
    [_plan_nodes_count release];
    [_description_title release];
    [super dealloc];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
