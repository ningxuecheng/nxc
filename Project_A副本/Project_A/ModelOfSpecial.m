//
//  ModelOfSpecial.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfSpecial.h"

@implementation ModelOfSpecial
- (void)dealloc {
    [_id release];
    [_name release];
    [_title release];
    [_image_url release];
    [_destination_id release];
    [super dealloc];
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key {};
@end
