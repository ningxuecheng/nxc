//
//  CellForImageTableViewCell.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellForImageTableViewCell.h"

@implementation CellForImageTableViewCell



- (void)dealloc {
    [_imageForPic release];
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
    self.imageForPic = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageForPic];
    [_imageForPic release];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageForPic.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, [[self class] heightForImg:self.imageForPic.image]);
   

}


/** 等比例计算图片高度*/
+ (CGFloat)heightImageView:(NSString *)name {

  /** 创建UIImage 对象 */
   
    UIImage *img = [UIImage imageNamed:name];

    /** 利用image 的 size属性*/

    return img.size.height / img.size.width * ([UIScreen mainScreen].bounds.size.width - 20) + 20;

}

+ (CGFloat)heightForImg:(UIImage *)img {
return img.size.height / img.size.width * ([UIScreen mainScreen].bounds.size.width - 20);

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
