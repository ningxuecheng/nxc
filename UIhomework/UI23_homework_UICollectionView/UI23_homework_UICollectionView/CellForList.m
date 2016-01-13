//
//  CellForList.m
//  UI23_homework_UICollectionView
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellForList.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
@interface CellForList ()
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *label_title;

@end

@implementation CellForList

- (void)awakeFromNib {
    self.imgPic.backgroundColor = [UIColor grayColor];
}

- (void)passModel:(Model *)mod {
  
    self.label_title.text = mod.title;
    NSURL *url = [NSURL URLWithString:mod.normal];
    [self.imgPic sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1.jpg"] options:SDWebImageProgressiveDownload];
}

@end
