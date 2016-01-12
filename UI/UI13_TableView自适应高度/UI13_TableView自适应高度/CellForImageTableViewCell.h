//
//  CellForImageTableViewCell.h
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellForImageTableViewCell : UITableViewCell


@property (nonatomic, retain) UIImageView *imageForPic;


+ (CGFloat)heightImageView:(NSString *)name;

@end
