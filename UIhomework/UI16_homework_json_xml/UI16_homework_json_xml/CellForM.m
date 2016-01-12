//
//  CellForM.m
//  UI16_homework_json_xml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellForM.h"
#import "Cartoon.h"
@interface CellForM ()
@property (retain, nonatomic) IBOutlet UILabel *label_name;
@property (retain, nonatomic) IBOutlet UILabel *label_desc;


@end

@implementation CellForM

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        self.label_desc.numberOfLines = 0;
//        self.label_name.numberOfLines = 0;
//    }
//
//    return self;
//}


+ (CGFloat)heightForRow:(NSString *)str {
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height + 5 + 5 + 5 + 60 +40;
}

- (void)passModel:(Cartoon *)model {

    self.label_name.text = model.name;
    //self.label_name.numberOfLines = 0;
    self.label_desc.text = model.desc;
    //self.label_desc.numberOfLines = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label_desc.numberOfLines = 0;
    self.label_name.numberOfLines = 0;

}

- (void)dealloc {
    [_label_name release];
    [_label_desc release];
    [super dealloc];
}
@end
