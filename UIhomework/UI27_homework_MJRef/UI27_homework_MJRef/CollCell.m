//
//  CollCell.m
//  UI27_homework_MJRef
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CollCell.h"
#import "ModleTitle.h"
#import <UIImageView+WebCache.h>
@interface CollCell ()
@property (retain, nonatomic) IBOutlet UILabel *label_title;

@property (retain, nonatomic) IBOutlet UIImageView *imgView;


@end


@implementation CollCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)passModel:(ModleTitle *)model {

    self.label_title.text = model.title;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"1.JPG"] options:SDWebImageProgressiveDownload];


}
- (void)dealloc {
    [_imgView release];
    [_label_title release];
    [super dealloc];
}
@end
