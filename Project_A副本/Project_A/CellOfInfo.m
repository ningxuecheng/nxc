//
//  CellOfInfo.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfInfo.h"
#import "ModelOfInfo.h"
#import <UIImageView+WebCache.h>
@interface CellOfInfo ()
@property (nonatomic, retain) UILabel *label_name_cn;
@property (nonatomic, retain) UILabel *label_name_en;
@property (nonatomic, retain) UILabel *label_add_count;
@property (nonatomic, retain) UIImageView *imgBack;
@end


@implementation CellOfInfo
- (void)dealloc {
    [_label_add_count release];
    [_label_name_cn release];
    [_label_name_en release];
    [_imgBack release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }


    return self;
}

- (void)passModel:(ModelOfInfo *)model {
    self.label_name_cn.text = model.name_zh_cn;
    self.label_name_en.text = model.name_en;
    self.label_add_count.text =[NSString stringWithFormat:@"%@旅游地",model.poi_count];
    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    
}
- (void)createViews {
    self.imgBack = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgBack];
    
    self.label_name_cn = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_name_cn];
    
    self.label_name_en = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_name_en];
    
    self.label_add_count = [[UILabel alloc] init];
    self.label_add_count.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.label_add_count];
    
    [_label_name_en release];
    [_label_name_cn release];
    [_imgBack release];

}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgBack.frame = self.contentView.bounds;
    self.label_name_cn.frame = CGRectMake(5, 5, 200, 25);
    self.label_name_en.frame = CGRectMake(5, 30, 200, 25);
    self.label_add_count.frame = CGRectMake(10, 150, self.frame.size.width - 20, 25);
  }


@end
