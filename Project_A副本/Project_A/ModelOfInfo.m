//
//  ModelOfInfo.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfInfo.h"

@implementation ModelOfInfo

- (void)dealloc {
    [_id release];
    [_image_url release];
    [_lat release];
    [_lng release];
    [_name_en release];
    [_name_zh_cn release];
    [_poi_count release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}
@end
