//
//  CellOfRaiders.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfRaiders.h"
#import "ModelOfRaiders.h"
#import "ViewOfRaiders.h"
#import <UIImageView+WebCache.h>

#define WIDTH  self.contentView.frame.size.width
#define HEIGHT self.contentView.frame.size.height
@interface CellOfRaiders ()
@property (nonatomic, retain) UIImageView *imgBack;
@property (nonatomic, retain) UILabel *label_name_cn;
@property (nonatomic, retain) UILabel *label_name_en;
@property (nonatomic, retain) NSString *strid;
@end
@implementation CellOfRaiders

- (void)dealloc {
    [_strid release];
    [_imgBack release];
    [_label_name_cn release];
    [_label_name_en release];
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
    
    self.label_name_cn = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_name_cn];
    [_label_name_cn release];
    
    self.label_name_en = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_name_en];
    [_label_name_en release];
    
   
    
}

- (void)passModel:(ModelOfRaiders *)mod {
    NSString *str = [NSString stringWithFormat:@"%@ %@",mod.name_zh_cn,mod.name_en];
     self.label_name_cn.text = str;
    self.strid = mod.id;
    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:mod.image_url] placeholderImage:nil options:SDWebImageProgressiveDownload];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgBack.frame = CGRectMake(15, 5, WIDTH - 30, HEIGHT - 5 - 80);
    self.label_name_cn.frame = CGRectMake(20, 10, WIDTH - 20, 30);
    
    
    
    ViewOfRaiders *view1 = [[ViewOfRaiders alloc] initWithFrame:CGRectMake(15, HEIGHT - 80,(WIDTH - 30)/4, 80) img:@"iconfont-jiadiandeng" title:@"攻略"];
    view1.block = ^() {
        self.block(self.strid,@"攻略");
    };
    [self.contentView addSubview:view1];
    [view1 release];
    
    ViewOfRaiders *view2 = [[ViewOfRaiders alloc] initWithFrame:CGRectMake(15 +((WIDTH - 30)/4 * 1) , HEIGHT - 80,(WIDTH - 30)/4, 80) img:@"iconfont-luxian" title:@"行程"];
    view2.block = ^() {
        self.block(self.strid,@"行程");
    };
    [self.contentView addSubview:view2];
    [view2 release];
    
    ViewOfRaiders *view3 = [[ViewOfRaiders alloc] initWithFrame:CGRectMake(15 + ((WIDTH - 30)/4 * 2), HEIGHT - 80,(WIDTH - 30)/4, 80) img:@"iconfont-tubiao05" title:@"旅行地"];
    [self.contentView addSubview:view3];
    view3.block = ^() {
        self.block(self.strid,@"旅行地");
    };

    [view3 release];
    
    ViewOfRaiders *view4 = [[ViewOfRaiders alloc] initWithFrame:CGRectMake(15 + ((WIDTH - 30)/4 * 3), HEIGHT - 80,(WIDTH - 30)/4, 80) img:@"iconfont-zhuanti" title:@"专题"];
    [self.contentView addSubview:view4];
    view4.block = ^() {
        self.block(self.strid,@"专题");
    };

    [view4 release];
    
    

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
