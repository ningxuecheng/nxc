//
//  CellOfNews.m
//  ui_自定义cell高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfNews.h"
#import "Model.h"

#define WIDTH  [UIScreen mainScreen].bounds.size.width
@interface CellOfNews ()
@property (nonatomic, retain) UILabel *label_title;
@property (nonatomic, retain) UILabel *label_summary;

@end


@implementation CellOfNews


- (void)dealloc {
   
    [_label_summary release];
    [_label_title release];
    [super dealloc];


}

- (void)passModel:(Model *)model {

    self.label_summary.text = model.summary;
    self.label_title.text = model.title;

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubView];
    }


    return self;
}



- (void)createSubView {

    self.label_title = [[UILabel alloc] init];
    self.label_title.numberOfLines = 0;
    
    self.label_summary = [[UILabel alloc] init];
    self.label_summary.numberOfLines = 0;
    
    [self.contentView addSubview:self.label_title];
    [self.contentView addSubview:self.label_summary];
    [_label_title release];
    [_label_summary release];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label_title.frame = CGRectMake(10, 10, WIDTH - 20, [[self class] hightLines:self.label_title.text]);
    
    self.label_summary.frame = CGRectMake(10, 20 + [[self class] hightLines:self.label_title.text], WIDTH - 20, [[self class] hightLines:self.label_summary.text]);

}

+ (CGFloat)heightOfLines:(Model *)mod {

    CGRect rect = [mod.summary boundingRectWithSize:CGSizeMake(WIDTH - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];


    return rect.size.height + 50 + 10 + 10 +10;
}

+ (CGFloat)hightLines:(NSString *)string {
    CGRect rect = [string boundingRectWithSize:CGSizeMake(WIDTH - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    
    return rect.size.height;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
