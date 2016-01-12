//
//  CellOfNews.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfNews.h"
#import "ModelOfNews.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface CellOfNews ()

@property (nonatomic, retain) UILabel *labelOfTitle;
@property (nonatomic, retain) UILabel *lableOfSummary;

@end


@implementation CellOfNews

- (void)dealloc {
    [_labelOfTitle release];
    [_lableOfSummary release];

    [super dealloc];

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
        
    }

    return self;

}


- (void)createSubViews {
    self.labelOfTitle = [[UILabel alloc] init];
    self.lableOfSummary = [[UILabel alloc] init];
    [self.contentView addSubview:self.lableOfSummary];
    [self.contentView addSubview:self.labelOfTitle];
    self.lableOfSummary.numberOfLines = 0;
    self.labelOfTitle.numberOfLines = 0;
    //self.lableOfSummary.lineBreakMode = NSLineBreakByWordWrapping;

    [_lableOfSummary release];
    [_labelOfTitle release];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    /** 子控件frame设置*/
    
    self.labelOfTitle.frame = CGRectMake(10, 10, WIDTH - 20, 50);
    self.lableOfSummary.frame = CGRectMake(10, 10 + 50+10, WIDTH - 20, [[self class] heightForLabel:self.lableOfSummary.text]) ;
    
    


}

- (void)passModel:(ModelOfNews *)model {
    self.labelOfTitle.text = model.title;
    self.lableOfSummary.text = model.summary;


}


+ (CGFloat)heightForLabel:(NSString *)text {
   
    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;


}


+ (CGFloat)heightForCell:(ModelOfNews *)model {

   

    return  [CellOfNews heightForLabel:model.summary] + 10 +50 +10 + 10;
    
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
