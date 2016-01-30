//
//  TravelOfCell.m
//  Project_A
//
//  Created by dllo on 16/1/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TravelOfCell.h"
#import "ModelOfTravels.h"
#import <UIImageView+WebCache.h>
#define WIDTH self.frame.size.width
#define HEIGHT  self.view.frame.size.height
@interface TravelOfCell ()
@property (nonatomic, retain) UIImageView *imgBack;
@property (nonatomic, retain) UILabel *label_title;
@property (nonatomic, retain) UILabel *label_date;
@end

@implementation TravelOfCell
- (void)dealloc {
    [_imgBack release];
    [_label_date release];
    [_label_title release];
    [super dealloc];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createViews];
        
    }
    return self;


}
- (void)passModel:(ModelOfTravels *)model {
    [self.imgBack sd_setImageWithURL:[NSURL URLWithString:model.front_cover_photo_url] placeholderImage:nil options:SDWebImageProgressiveDownload];
    self.label_title.text = model.name;
    NSString *string = [NSString stringWithFormat:@"%@/%@天,%@图",model.start_date,model.days,model.photos_count];
    self.label_date.text = string;

}
- (void)createViews {
    self.imgBack = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgBack];
    [_imgBack release];
    self.label_title = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_title];
    [_label_title release];
    self.label_date = [[UILabel alloc] init];
    [self.contentView addSubview:self.label_date];
    [_label_date release];

}

- (void)layoutSubviews {
  [super layoutSubviews];
    self.imgBack.frame = CGRectMake(10, 5, WIDTH - 20, 170);
    self.label_title.frame = CGRectMake(20, 15, WIDTH - 40, 30);
    self.label_date.frame = CGRectMake(20, 50, WIDTH - 40, 20);

}
- (void)awakeFromNib {
    // Initialization code
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
