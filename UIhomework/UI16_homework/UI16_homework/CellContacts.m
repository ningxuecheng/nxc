//
//  CellContacts.m
//  UI16_homework
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellContacts.h"
#import "Contacts.h"
@interface CellContacts()
@property (nonatomic, retain) UIImageView *imageHead;
@property (nonatomic, retain) UILabel *label_name;
@property (nonatomic, retain) UILabel *label_time;
@property (nonatomic, retain) UILabel *label_message;
@end

@implementation CellContacts

- (void)dealloc {
    [_imageHead release];
    [_label_message release];
    [_label_name release];
    [_label_time release];
    [super dealloc];

}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor redColor];
        [self createView];
    }
    
    
    
    return  self;
}

- (void)createView {
    self.imageHead = [[UIImageView alloc] init];
    self.imageHead.backgroundColor = [UIColor grayColor];
    self.label_name = [[UILabel alloc] init];
    self.label_time = [[UILabel alloc] init];
    self.label_message = [[UILabel alloc] init];

    [self.contentView addSubview:self.imageHead];
    [self.contentView addSubview:self.label_message];
    [self.contentView addSubview:self.label_name];
    [self.contentView addSubview:self.label_time];

    [_label_time release];
    [_label_name release];
    [_label_message release];
    [_imageHead release];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageHead.frame = CGRectMake(10, 0, self.contentView.frame.size.height - 10, self.contentView.frame.size.height);
    self.imageHead.layer.cornerRadius =self.contentView.frame.size.height /2;
   self.imageHead.layer.masksToBounds =YES;
    
    self.label_name.frame = CGRectMake(15 +self.contentView.frame.size.height - 10, 5, 150, 35);
  
    
    self.label_message.frame = CGRectMake(15 +self.contentView.frame.size.height - 10, 45, self.contentView.frame.size.width -15 +self.contentView.frame.size.height - 10 , 30);
    
    
    self.label_time.frame = CGRectMake(self.contentView.frame.size.width - 70, 5, 65, 30);
   

}
- (void)passModel:(Contacts *)contact {
    self.label_name.text = contact.name;
    self.label_message.text = contact.phone;
    self.label_time.text = contact.hobby;
    self.imageHead.image = [UIImage imageNamed:contact.photo];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
