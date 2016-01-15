//
//  CollectionViewCell.m
//  MyFlowLayout
//
//  Created by 苗旭萌 on 15/10/9.
//  Copyright (c) 2015年 苗旭萌. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}



@end
