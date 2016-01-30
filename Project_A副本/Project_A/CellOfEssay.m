//
//  CellOfEssay.m
//  Project_A
//
//  Created by dllo on 16/1/29.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfEssay.h"
#import "ModelOfEssay.h"
#import <UIImageView+WebCache.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGH [UIScreen mainScreen].bounds.size.height

@interface CellOfEssay ()
@property (nonatomic, retain) UILabel *label_des;
@property (nonatomic, retain) UIImageView *imgBack;
@property (nonatomic, retain) NSNumber *width;
@property (nonatomic, retain) NSNumber *height;
@property (nonatomic, assign) CGFloat xHeight;
@property (nonatomic, retain) NSString *urlOfIMG;
@end

@implementation CellOfEssay

- (void)dealloc {
    [_urlOfIMG release];
    [_width release];
    [_height release];
    [_label_des release];
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
    self.label_des = [[UILabel alloc] init];
    self.label_des.numberOfLines = 0;
    [self.contentView addSubview:self.label_des];
    [_label_des release];
    
    self.imgBack = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgBack];
    [_imgBack release];
}


- (void)passAnyModel:(id)model {
    ModelOfEssay *essay = model;
    if (essay.url&&![essay.description_s isEqual:[NSNull null]]&&![essay.description_s isEqual:@""]) {
        
        self.label_des.text = essay.description_s;
    }
    
    
    self.urlOfIMG = essay.url;
        self.width = essay.image_width;
        self.height = essay.image_height;
        CGFloat ww = self.width.floatValue;
        CGFloat hh = self.height.floatValue;
        CGFloat xOfimg = hh * (WIDTH - 30) / ww;
        self.xHeight = xOfimg;
        [self.imgBack sd_setImageWithURL:[NSURL URLWithString:essay.url] placeholderImage:[UIImage imageNamed:@"2.jpg"] options:SDWebImageProgressiveDownload];
}


+ (CGFloat)heightForLabel:(NSString *)text {
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 30, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
    
    
}

- (CGFloat)heightForCell:(ModelOfEssay *)model {
    return  [CellOfEssay heightForLabel:model.description_s] + 20 ;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat labelHeight = [[self class] heightForLabel:self.label_des.text];
        self.label_des.frame = CGRectMake(15, 10, WIDTH - 30,labelHeight );
        
        self.imgBack.frame = CGRectMake(15, 10 +5 +labelHeight, WIDTH - 30,self.xHeight);
      
   
}




@end
