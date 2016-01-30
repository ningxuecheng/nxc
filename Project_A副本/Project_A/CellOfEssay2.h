//
//  CellOfEssay2.h
//  Project_A
//
//  Created by dllo on 16/1/29.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellRoot.h"

@class ModelOfEssay;


@interface CellOfEssay2 : CellRoot
- (CGFloat)heightForCell:(ModelOfEssay *)model;


- (void)passModel:(ModelOfEssay *)model;
@end
