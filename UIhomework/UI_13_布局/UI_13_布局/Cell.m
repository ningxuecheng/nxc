//
//  Cell.m
//  UI_13_布局
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Cell.h"
#import "ModelForList.h"
@interface Cell()
@property (retain, nonatomic) IBOutlet UIView *backView;
@property (retain, nonatomic) IBOutlet UILabel *label_title;
@property (retain, nonatomic) IBOutlet UIView *viewWhite;
@property (retain, nonatomic) IBOutlet UILabel *startTime;
@property (retain, nonatomic) IBOutlet UILabel *label_display;

@property (retain, nonatomic) IBOutlet NSLayoutConstraint *label_interst;


@end

@implementation Cell


- (void)layoutSubviews {
    [super layoutSubviews];
    self.backView.layer.cornerRadius = 20;
    self.viewWhite.layer.cornerRadius = 5;
    self.viewWhite.layer.shadowOffset = CGSizeMake(0, 1);
    self.viewWhite.layer.shadowOpacity = 1;

}


- (void)passModel:(ModelForList *)model {

    self.label_title.text = model.title;
    self.startTime.text = model.begin_time;


}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
   
    [_backView release];
    
   
    [_label_title release];
    [_viewWhite release];
    [_startTime release];
    [_label_display release];
    [_label_interst release];
    [super dealloc];
}
@end
