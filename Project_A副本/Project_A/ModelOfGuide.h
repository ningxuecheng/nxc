//
//  ModelOfGuide.h
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelRoot.h"

@interface ModelOfGuide : ModelRoot
@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *children;

- (instancetype)initWithArr;
@end
