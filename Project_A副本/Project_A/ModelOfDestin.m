//
//  ModelOfDestin.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfDestin.h"

@implementation ModelOfDestin


- (void)dealloc {
    [_id release];
    [_name release];
    [_attraction_trips_count release];
    [_user_score release];
    [_description_summary release];
    [_image_url release];
    [super dealloc];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {


}
@end
