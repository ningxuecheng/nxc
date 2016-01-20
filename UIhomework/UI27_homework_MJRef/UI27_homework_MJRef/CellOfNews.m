//
//  CellOfNews.m
//  UI27_homework_MJRef
//
//  Created by dllo on 16/1/19.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfNews.h"
#import "Model.h"
#import <UIImageView+WebCache.h>
@interface CellOfNews ()
@property (retain, nonatomic) IBOutlet UIImageView *imgView;
@property (retain, nonatomic) IBOutlet UILabel *label_title;
@property (retain, nonatomic) IBOutlet UILabel *label_dec;

@end


@implementation CellOfNews

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)passModel:(Model *)model {

    self.label_title.text = model.title;
    self.label_dec.text = model.digest;
    self.label_dec.numberOfLines = 0;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"1.jpg"] options:SDWebImageProgressiveDownload];

}
- (void)dealloc {
    [_imgView release];
    [_label_title release];
    [_label_dec release];
    [super dealloc];
}
@end
