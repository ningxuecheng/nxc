//
//  CellOfEssay2.m
//  Project_A
//
//  Created by dllo on 16/1/29.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfEssay2.h"
#import "ModelOfEssay.h"
#import <UIImageView+WebCache.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGH self.contentView.bounds.size.height
@interface CellOfEssay2 ()
@property (nonatomic, retain) UILabel *label_des;
@end
@implementation CellOfEssay2
- (void)dealloc {
    [_label_des release];
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
    
}



- (void)passModel:(ModelOfEssay *)model {
   

 self.label_des.text = model.description_s;
    //NSLog(@"model :%@",model.description_s);
}

+ (CGFloat)heightForLabel:(NSString *)text {
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 30, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
    
    
}

- (CGFloat)heightForCell:(ModelOfEssay *)model {
    
    return  [CellOfEssay2 heightForLabel:model.description_s] + 20;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.label_des.frame = CGRectMake(15, 5, WIDTH - 30, [[self class] heightForLabel:self.label_des.text]+10);
    
}


@end
