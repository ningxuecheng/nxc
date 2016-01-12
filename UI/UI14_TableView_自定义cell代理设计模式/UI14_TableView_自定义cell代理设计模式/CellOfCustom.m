//
//  CellOfCustom.m
//  UI14_TableView_自定义cell代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfCustom.h"
#import "ScrollForCell.h"

#define WIDTH self.contentView.frame.size.width
#define HEIGHT self.contentView.frame.size.height
@interface CellOfCustom ()
@property (nonatomic, retain) ScrollForCell *scroll;
@property (nonatomic, retain) UIButton *btnForDel;
@property (nonatomic, retain) UIButton *btnForEdit;


@end


@implementation CellOfCustom
- (void)dealloc {

    [_btnForDel release];
    [_btnForEdit release];
    [_scroll release];
    
    [_label_title release];
    [super dealloc];


}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubview];
    }

    return self;
}

- (void)createSubview {
    // scrollView
    self.scroll = [[ScrollForCell alloc] init];
    [self.contentView addSubview:self.scroll];
    [_scroll release];
    
    self.backgroundColor = [UIColor grayColor];
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.bounces = NO;
    self.scroll.pagingEnabled = YES;
    
    // btnForDele
    
//    self.btnForDel = [UIButton buttonWithType:UIButtonTypeSystem];
    
    
//    [self.btnForDel setTitle:@"Delete" forState:UIControlStateNormal];
//    self.btnForDel.backgroundColor = [UIColor redColor];
    
    self.btnForDel = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnForDel setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
    [self.scroll addSubview:self.btnForDel];
//    [self.btnForDel setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
    
    [self.btnForDel addTarget:self action:@selector(DelAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // btnForEdit
    
    self.btnForEdit = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.scroll addSubview:self.btnForEdit];
    [self.btnForEdit setTitle:@"Edit" forState:UIControlStateNormal];
    self.btnForEdit.backgroundColor = [UIColor blueColor];

    
    self.label_title = [[UILabel alloc] init];
    [self.scroll addSubview:self.label_title];
    [_label_title release];

}

- (void)DelAction:(UIButton *) btn {
    if ([self.delegate respondsToSelector:@selector(handleDelAction:)]) {
        [self.delegate handleDelAction:self];
    }
  

}

- (void)layoutSubviews {
    [super layoutSubviews];
    //scroll
    self.scroll.frame = self.contentView.frame;
    self.scroll.contentSize = CGSizeMake(WIDTH + 50 + 80, HEIGHT);
    
    self.btnForEdit.frame = CGRectMake(WIDTH, 0, 50, HEIGHT);
    self.btnForDel.frame = CGRectMake(WIDTH + 50, 0, 80, HEIGHT);

    self.label_title.frame = CGRectMake(10, 10, 100, HEIGHT - 20);
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
