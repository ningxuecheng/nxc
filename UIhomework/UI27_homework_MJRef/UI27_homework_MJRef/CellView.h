//
//  CellView.h
//  UI08_homework
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellView : UIView
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *label_name;
@property (nonatomic, retain) UILabel *label_tel;
@property (nonatomic, retain) UIView *line;

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)arr
                      namearr:(NSArray *)namearr
                       telarr:(NSArray *)telarr;

@end
