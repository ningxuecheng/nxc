//
//  CellOfTrip.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfTrip.h"
#import "ModelOfTrip.h"
#import <UIImageView+WebCache.h>
#define WIDTH self.contentView.bounds.size.width
#define HEIGHT self.contentView.bounds.size.height
@interface CellOfTrip ()
@property (nonatomic, retain) UILabel *label_name;
@property (nonatomic, retain) UILabel *label_day;
@property (nonatomic, retain) UILabel *label_des;
@property (nonatomic, retain) UILabel *label_count;
@property (nonatomic, retain) UIImageView *imgBack;
@property (nonatomic, retain) UIImageView *imgTime;
@property (nonatomic, retain) UIImageView *imgdes;
@end


@implementation CellOfTrip

- (void)dealloc {
    [_label_count release];
    [_label_day release];
    [_label_des release];
    [_label_name release];
    [_imgBack release];
    [_imgdes release];
    [_imgTime release];
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
    
    self.label_count = [[UILabel alloc] init];
    self.label_count.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.label_count];
    [_label_count release];
    
    self.label_day = [[UILabel alloc] init];
    self.label_day.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.label_day];
    [_label_day release];
    
    self.label_des = [[UILabel alloc] init];
    self.label_des.numberOfLines = 0;
    [self.contentView addSubview:self.label_des];
    [_label_des release];
    
    self.label_name = [[UILabel alloc] init];;
    [self.contentView addSubview:self.label_name];
    [_label_name release];
    
    self.imgdes = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgdes];
    [_imgdes release];
    
    self.imgTime = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgTime];
    [_imgTime release];
    
    

}

- (void)passModel:(ModelOfTrip *)model {
    self.label_name.text = model.name;
    self.label_des.text = model.description_title;
    self.label_day.text = [NSString stringWithFormat:@"%@天",model.plan_days_count];
    self.label_count.text = [NSString stringWithFormat:@"%@个旅行地",model.plan_nodes_count];

    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    self.imgTime.image = [UIImage imageNamed:@"iconfont-time"];
    self.imgdes.image = [UIImage imageNamed:@"iconfont-didian-2"];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgBack.frame = CGRectMake(15, 5, WIDTH- 30, (HEIGHT - 10)/5 *3);
    self.label_des.frame = CGRectMake(15, (HEIGHT - 10)/5 *3 + 5, WIDTH - 30, (HEIGHT - 10)/5 *2);
    
    self.label_name.frame = CGRectMake(20, (5 + (HEIGHT - 10)/5 *3)-70 , WIDTH - 40, 40);
    self.imgTime.frame = CGRectMake(20, (5 + (HEIGHT - 10)/5 *3) - 30, 16, 16);
    self.label_day.frame = CGRectMake(20 + 16, (5 + (HEIGHT - 10)/5 *3) - 30, 25, 16);
    self.imgdes.frame = CGRectMake(20 + 16 + 25, (5 + (HEIGHT - 10)/5 *3) - 30, 16, 16);
    self.label_count.frame = CGRectMake(20 + 16 + 25+ 16, (5 + (HEIGHT - 10)/5 *3) - 30, 100, 16);
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
