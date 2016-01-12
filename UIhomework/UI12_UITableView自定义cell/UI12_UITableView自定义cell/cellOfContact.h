//
//  cellOfContact.h
//  UI12_UITableView自定义cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellOfContact : UITableViewCell

/** 将cell上的子控件生命为属性，方便外面赋值*/
@property (nonatomic, retain) UIImageView *imageL;
@property (nonatomic, retain) UIImageView *imageR;
@property (nonatomic, retain) UIImageView *imageC;

@end
