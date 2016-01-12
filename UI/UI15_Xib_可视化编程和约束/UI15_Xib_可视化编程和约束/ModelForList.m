//
//  ModelForList.m
//  UI15_Xib_可视化编程和约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ModelForList.h"

@implementation ModelForList

- (void)dealloc {

    [_address release];
    [_title release];
    [_participant_count release];
    [_end_time release];
    [_begin_time release];
    [_wisher_count release];
    [_category_name release];
    [super dealloc];


}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {


}
@end
