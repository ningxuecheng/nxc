//
//  ModelOfModel.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfTravels.h"

@implementation ModelOfTravels
- (void)dealloc {
    [_id release];
    [_days release];
    [_front_cover_photo_url release];
    [_start_date release];
    [_name release];
    [_photos_count release];
    [super dealloc];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {


}
@end
