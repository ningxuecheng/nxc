//
//  ModelFilm.m
//  UI15Xib_homework
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ModelFilm.h"

@implementation ModelFilm
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
