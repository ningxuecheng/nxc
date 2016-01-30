//
//  CellOfDesInfo.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfDesInfo.h"
#import "ModelOfDesInfo.h"
#import <UIImageView+WebCache.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT self.contentView.bounds.size.height
@interface CellOfDesInfo ()
@property (nonatomic, retain) UILabel *label_title;
@property (nonatomic, retain) UILabel *label_des;
@property (nonatomic, retain) UIImageView *imgBack;
@property (nonatomic, retain) UIImageView *imgMark;
@property (nonatomic, assign) CGFloat imgHeight;
@end
@implementation CellOfDesInfo
- (void)dealloc {
    [_label_title release];
    [_label_des release];
    [_imgMark release];
    [_imgBack release];
    [super dealloc];
}

- (void)passAnyModel:(id)model {
    ModelOfDesInfo *modelInfo = model;
    self.label_title.text = modelInfo.entry_name;
    self.label_des.text = modelInfo.tips;
    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:modelInfo.image_url] placeholderImage:[UIImage imageNamed:@"2.jpg"] options:SDWebImageProgressiveDownload];
    if ([modelInfo.attraction_type isEqualToString:@"transport"]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-jichang"];
    } else {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-17"];
    }
    
    CGFloat  wid = [modelInfo.lng floatValue];
    CGFloat  hei = [modelInfo.lat floatValue];
    
    self.imgHeight = hei * (WIDTH - 30) / wid;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createViews];
    }

    return self;
}

- (void)createViews {

    self.label_des = [[UILabel alloc] init];
    self.label_des.numberOfLines = 0;
    [self.contentView addSubview:self.label_des];
    [_label_des release];
    
    self.label_title = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_title];
    [_label_title release];
    
    
    self.imgBack = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgBack];
    [_imgBack release];
    
    self.imgMark = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgMark];
    [_imgMark release];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imgMark.frame = CGRectMake(15, 10, 32, 32);
    
    self.label_title.frame = CGRectMake(5+15+32+5, 10, WIDTH - 5+15+32+5 - 15, 35);
    self.imgBack.frame = CGRectMake(15, 40, WIDTH - 30,( WIDTH - 30)*0.65);
    
    self.label_des.frame = CGRectMake(15, 40 + ( WIDTH - 30)*0.7 + 10, WIDTH - 30, [[self class] heightForLabel:self.label_des.text]);
    
}


+ (CGFloat)heightForLabel:(NSString *)text {
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 30, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
    
    
}

- (CGFloat)heightForCell:(ModelOfDesInfo *)model {
    return  [CellOfDesInfo heightForLabel:model.tips] + 40 + 5 + 20;
    
}








@end
