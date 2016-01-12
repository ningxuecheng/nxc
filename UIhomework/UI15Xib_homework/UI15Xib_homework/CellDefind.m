//
//  CellDefind.m
//  UI15Xib_homework
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellDefind.h"
#import "ModelFilm.h"
@interface CellDefind ()
@property (retain, nonatomic) IBOutlet UIView *backView;
@property (retain, nonatomic) IBOutlet UILabel *label_title;
@property (retain, nonatomic) IBOutlet UILabel *label_start_time;
@property (retain, nonatomic) IBOutlet UILabel *label_end_time;
@property (retain, nonatomic) IBOutlet UILabel *label_add;
@property (retain, nonatomic) IBOutlet UILabel *label_interst;
@property (retain, nonatomic) IBOutlet UILabel *label_take;

@property (retain, nonatomic) IBOutlet UILabel *label_kand;


@end


@implementation CellDefind

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)passModel:(ModelFilm *)mod {

    self.label_title.text = mod.title;
    self.label_start_time.text = mod.begin_time;
    self.label_end_time.text = mod.end_time;
    self.label_add.text = mod.address;
    self.label_kand.text = mod.category_name;
    //self.label_take.text = mod.wisher_count;
    //self.label_interst.text = mod.participant_count.description;

}

- (void)dealloc {
    [_backView release];
    [_label_title release];
    [_label_start_time release];
    [_label_end_time release];
    [_label_add release];
    [_label_interst release];
    [_label_take release];
    [_label_kand release];
    [super dealloc];
}
@end
