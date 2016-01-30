//
//  ModelOfDesInfo.h
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelRoot.h"

@interface ModelOfDesInfo : ModelRoot
@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *entry_id;
@property (nonatomic, retain) NSString *tips;
@property (nonatomic, retain) NSNumber *lat;
@property (nonatomic, retain) NSNumber *lng;
@property (nonatomic, retain) NSString *image_url;
@property (nonatomic, retain) NSString *entry_name;
@property (nonatomic, retain) NSString *attraction_type;


@end
