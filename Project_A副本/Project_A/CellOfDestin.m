//
//  CellOfDestin.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfDestin.h"
#import "ModelOfDestin.h"
#import <UIImageView+WebCache.h>
#define WIDTH self.contentView.bounds.size.width
#define HEIGHT self.contentView.bounds.size.height
@interface CellOfDestin ()
@property (nonatomic, retain) UILabel *label_name;
@property (nonatomic, retain) UILabel *label_des;
@property (nonatomic, retain) UIImageView *imgBack;
@property (nonatomic, retain) UILabel *label_count;
@property (nonatomic, retain) UILabel *label_score;
@end

@implementation CellOfDestin
- (void)dealloc {
    [_label_count release];
    [_label_des release];
    [_label_name release];
    [_imgBack release];
    [_label_score release];
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

    self.label_name = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_name];
    [_label_name release];
    
    self.label_des = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_des];
    [_label_des release];
    
    self.label_score = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_score];
    [_label_score release];
    
    self.imgBack = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgBack];
    [_imgBack release];
    
    self.label_count = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_count];
    [_label_count release];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imgBack.frame = CGRectMake(15, 10, (WIDTH - 30)*2/5, 90);
    self.label_name.frame = CGRectMake(25 + (WIDTH - 30)*2/5, 10,  (WIDTH - 30)*3/5, 30);
    self.label_score.frame = CGRectMake(25 + (WIDTH - 30)*2/5, 40,  (WIDTH - 30)*3/5, 20);
    self.label_count.frame = CGRectMake(15, 80, (WIDTH - 30)*2/5, 20);
    self.label_des.frame =CGRectMake(25 + (WIDTH - 30)*2/5, 60,  (WIDTH - 30)*3/5, 50);
    self.label_des.numberOfLines = 0;
}

- (void)passAnyModel:(id)model {
    ModelOfDestin *mod = model;
    self.label_name.text = mod.name;
    self.label_des.text = mod.description_summary;
    
    self.label_count.text =[NSString stringWithFormat:@"%@",mod.attraction_trips_count];
    self.label_count.textAlignment = 1;
    
    self.label_score.text = [NSString stringWithFormat:@"%@",mod.user_score];
    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:mod.image_url] placeholderImage:nil options:SDWebImageProgressiveDownload];
}


@end
