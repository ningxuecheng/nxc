//
//  CellSecond.h
//  ui_自定义cell高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellSecond : UITableViewCell

@property (nonatomic, retain) UIImageView *img;

+(CGFloat)heightOfLines:(NSString *)string;

@end
