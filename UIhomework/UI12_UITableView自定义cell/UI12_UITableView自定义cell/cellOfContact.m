//
//  cellOfContact.m
//  UI12_UITableView自定义cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "cellOfContact.h"

@implementation cellOfContact

- (void)dealloc {
    [_imageC release];
    [_imageL release];
    [_imageR release];
    [super dealloc];

}


 /** 子控件的创建 一般选择在cell创建的时候。*/

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        /** 3个子控件的创建 */
        
        
        
        
        NSLog(@"%s,%f,%f",__FUNCTION__,self.contentView.frame.size.width,self.contentView.frame.size.height);
        
        [self createImage];
        
        
    }
    
    


    return self;
}

- (void)createImage {

    self.imageL = [[UIImageView alloc] init];
    self.imageL.backgroundColor = [UIColor grayColor];
    
    [self.contentView addSubview:self.imageL];
    [_imageL release];
    
    
    self.imageR = [[UIImageView alloc] init];

    self.imageR.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.imageR];
    [_imageR release];
    
    
    self.imageC = [[UIImageView alloc] init];
    self.imageC.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.imageC];
    [_imageC release];

}


/*自定义控件的设置 */


/** 子控件的frame设置，一般是在layoutSubviews方法中设置。
     layoutSubviews 是UIView的方法，View出现之前调用此方法
 
 */
- (void)layoutSubviews {
/** 必须先调用父类方法 */
    [super layoutSubviews];
    NSLog(@"%s,%f,%f",__FUNCTION__,self.contentView.frame.size.width,self.contentView.frame.size.height);
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    self.imageL.frame = CGRectMake(10, 10, (width - 40)/3, height - 20);
    self.imageC.frame = CGRectMake(20+(width - 40)/3, 10, (width- 40)/3, height- 20);
    self.imageR.frame = CGRectMake(30+(width - 40)/3*2, 10, (width-40)/3, height- 20);
    
    

}




/** 当cell 从xib文件进入时，会调用此方法*/

- (void)awakeFromNib {
    // Initialization code
}

/* 当点击cell是调用此方法 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
