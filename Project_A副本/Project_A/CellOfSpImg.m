//
//  CellOfSpImg.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfSpImg.h"
#import "ModelOfSpInfo.h"
#import <UIImageView+WebCache.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGH [UIScreen mainScreen].bounds.size.height
@interface CellOfSpImg ()
@property (nonatomic, retain) UILabel *label_des;
@property (nonatomic, retain) UIImageView *imgBack;
@property (nonatomic, retain) NSNumber *width;
@property (nonatomic, retain) NSNumber *height;
@property (nonatomic, assign) CGFloat xHeight;

@end

@implementation CellOfSpImg


- (void)dealloc {
    [_label_des release];
    [_imgBack release];
    [_width release];
    [_height release];
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
    self.label_des = [[UILabel alloc] init];
    self.label_des.numberOfLines = 0;
    [self.contentView addSubview:self.label_des];
    [_label_des release];
    
    self.imgBack = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgBack];
    [_imgBack release];
}


- (void)passAnyModel:(id)model {
    ModelOfSpInfo *modinfo = model;
    self.width = modinfo.image_width;
    self.height = modinfo.image_height;
    CGFloat ww = self.width.floatValue;
    CGFloat hh = self.height.floatValue;
    CGFloat xOfimg = hh * (WIDTH - 30) / ww;
    self.xHeight = xOfimg;
    NSLog(@"%f",self.xHeight);
    self.label_des.text = modinfo.description_s;
    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:modinfo.image_url] placeholderImage:[UIImage imageNamed:@"2.jpg"] options:SDWebImageProgressiveDownload];
}


+ (CGFloat)heightForLabel:(NSString *)text {
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 30, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
    
    
}

- (CGFloat)heightForCell:(ModelOfSpInfo *)model {
    return  [CellOfSpImg heightForLabel:model.description_s] + 20;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
        self.label_des.frame = CGRectMake(15, 10, WIDTH - 30, [[self class] heightForLabel:self.label_des.text]);
    self.imgBack.frame = CGRectMake(15, 10 +5 + [[self class] heightForLabel:self.label_des.text], WIDTH - 30,self.xHeight);
    
}



@end
