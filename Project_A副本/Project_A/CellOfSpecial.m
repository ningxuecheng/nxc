//
//  CellOfSpecial.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfSpecial.h"
#import "ModelOfSpecial.h"
#import <UIImageView+WebCache.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT self.contentView.frame.size.height
@interface CellOfSpecial ()
@property (nonatomic,retain) UILabel *label_name;
@property (nonatomic,retain) UILabel *label_title;
@property (nonatomic, retain) UIImageView *imgBack;

@end

@implementation CellOfSpecial
- (void)dealloc {
    [_label_title release];
    [_label_name release];
    [_imgBack release];
    [super dealloc];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createViews];
    }

    return self;

}

- (void)createViews {
    self.imgBack = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgBack];
    [_imgBack release];

    self.label_name = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_name];
    [_label_name release];
    
    self.label_title = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_title];
    [_label_title release];
    

}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.imgBack.frame = CGRectMake(15, 5, WIDTH - 30, (WIDTH - 30)*0.7);
    self.label_name.frame = CGRectMake(30, (WIDTH - 30)*0.7 - 60, WIDTH - 30, 30);
    self.label_title.frame = CGRectMake(30, (WIDTH - 30)*0.7 - 30, WIDTH - 30, 20);



}
- (void)pass:(ModelOfSpecial *)model {
    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:nil options:SDWebImageProgressiveDownload];
    self.label_title.text = model.title;
    self.label_name.text = model.name;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
