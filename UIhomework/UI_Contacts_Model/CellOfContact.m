//
//  CellOfContact.m
//  UI_Contacts_Model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfContact.h"
#import "Contacts.h"
@interface CellOfContact ()

@property (nonatomic, retain) UIImageView *imageL;
@property (nonatomic, retain) UILabel *labelName;
@property (nonatomic, retain) UILabel *labelPhone;

@end
@implementation CellOfContact
- (void)dealloc {
    [_imageL release];
    [_labelName release];
    [_labelPhone release];
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

    self.imageL = [[UIImageView alloc] init];
    self.labelName = [[UILabel alloc] init];
    self.labelPhone = [[UILabel alloc] init];

    [self.contentView addSubview:self.imageL];
    [self.contentView addSubview:self.labelPhone];
    [self.contentView addSubview:self.labelName];

    [_imageL release];
    [_labelPhone release];
    [_labelName release];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    self.imageL.frame = CGRectMake(50, 10, (width - 100) / 2 - 10, height - 20);
    self.labelName.frame = CGRectMake(50 + (width - 100) / 2 , 10, (width - 100) / 2 - 10, (height- 20)/2 - 5 );
    self.labelPhone.frame = CGRectMake(50 + (width - 100) / 2 , 10 +(height- 20)/2 , (width - 100) / 2 - 10, (height- 20)/2 - 5);


}

- (void)passModel:(Contacts *)con {

    self.labelPhone.text = con.name;
    self.labelName.text = con.phone;
    self.imageL.image = [UIImage imageNamed:con.photo];

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
