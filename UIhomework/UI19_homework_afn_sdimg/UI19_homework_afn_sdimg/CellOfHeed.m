//
//  CellOfHeed.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfHeed.h"
#import "headScollView.h"

@interface CellOfHeed ()
@property (nonatomic, retain) NSArray *arr;
@end
@implementation CellOfHeed

- (void)awakeFromNib {
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        
        
    }

    return self;


}


- (void)passHeadArray:(NSArray *)arr {
    self.arr = [NSArray arrayWithArray:arr];
}

- (void)layoutSubviews {

    [super layoutSubviews];

  headScollView *scoll = [[headScollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180) arr:self.arr];

    [self.contentView addSubview:scoll];

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
