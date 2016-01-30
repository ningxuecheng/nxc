//
//  ModelOfEssay.h
//  Project_A
//
//  Created by dllo on 16/1/29.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelRoot.h"

@interface ModelOfEssay : ModelRoot
@property (nonatomic, retain) NSString*entry_name;
@property (nonatomic, retain) NSString*entry_type;
@property (nonatomic, retain) NSString*attraction_type;
//@property (nonatomic, retain) NSString*description;
@property (nonatomic, retain) NSNumber*image_width;
@property (nonatomic, retain) NSNumber*image_height;
@property (nonatomic, retain) NSString*url;
@property (nonatomic, retain) NSString*description_s;
@property (nonatomic, retain) NSNumber *col;
@end
