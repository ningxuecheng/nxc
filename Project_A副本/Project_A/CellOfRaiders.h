//
//  CellOfRaiders.h
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelOfRaiders;
@interface CellOfRaiders : UITableViewCell

@property (nonatomic, copy) void (^block)(NSString * strid, NSString *type);

- (void)passModel:(ModelOfRaiders *)mod;
@end
