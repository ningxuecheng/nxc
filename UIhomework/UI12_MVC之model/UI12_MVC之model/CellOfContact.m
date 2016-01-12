//
//  CellOfContact.m
//  UI12_MVC之model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfContact.h"
#import "Contact.h"

@interface CellOfContact ()
/** 定义一个model属性，用来接受外部的model数据*/

@property (nonatomic, retain) UIImageView *imageL;
@property (nonatomic, retain) UILabel *lableName;

@end

@implementation CellOfContact

- (void)dealloc {
    [_imageL release];
    [_lableName release];
    [super dealloc];


}

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return  self;


}



- (void)createSubViews{

    self.imageL = [[UIImageView alloc] init];
    self.lableName = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.imageL];
    [self.contentView addSubview:self.lableName];
    [_imageL release];
    [_lableName release];



}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    self.imageL.frame = CGRectMake(10, 10, height - 20, height- 20);
    self.lableName.frame = CGRectMake(width - height - 20 - 10, 10, width-(width - height - 20 - 10), height - 20);
    


}

/** 重写con的setter方法*/

- (void)setCon:(Contact *)con {
    if (_con != con) {
        [_con release];
        _con = [con retain];
        
    }
    
    self.lableName.text = con.name;
    self.imageL.image = [UIImage imageNamed:con.photo];

}

- (void)passModel:(Contact *)con {

    self.lableName.text = con.name;
    self.imageL.image = [UIImage imageNamed:con.photo];



}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

}

@end
