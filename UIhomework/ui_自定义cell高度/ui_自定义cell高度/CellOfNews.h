//
//  CellOfNews.h
//  ui_自定义cell高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

@interface CellOfNews : UITableViewCell


- (void)passModel:(Model *)model;

+ (CGFloat)heightOfLines:(Model *)mod;
@end
