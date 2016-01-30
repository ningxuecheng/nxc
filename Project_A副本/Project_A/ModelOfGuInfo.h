//
//  ModelOfGuInfo.h
//  Project_A
//
//  Created by dllo on 16/1/28.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelRoot.h"

@interface ModelOfGuInfo : ModelRoot
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *sections;
- (instancetype)initWithArr;
@end
