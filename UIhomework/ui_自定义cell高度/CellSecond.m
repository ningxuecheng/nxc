//
//  CellSecond.m
//  ui_自定义cell高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellSecond.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
@implementation CellSecond

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc {
    [_img release];
    [super dealloc];

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }


    return self;
}


- (void)createView {

    self.img = [[UIImageView alloc] init];
    [self.contentView addSubview:self.img];
    [_img release];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.img.frame = CGRectMake(10, 10, WIDTH - 20, [[self class] heightOfImg:self.img.image]);

}


+ (CGFloat)heightOfLines:(NSString *)string {
    UIImage *image = [UIImage imageNamed:string];
    
    return image.size.height * (WIDTH - 20) / image.size.width + 20;
}

+ (CGFloat)heightOfImg:(UIImage *)img {

    return img.size.height * (WIDTH - 20) / img.size.width;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
