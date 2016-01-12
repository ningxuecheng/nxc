//
//  CellOfAdds.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfAdds.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
@interface CellOfAdds ()
@property (weak, nonatomic) IBOutlet UILabel *label_title;

@property (weak, nonatomic) IBOutlet UIImageView *imgViewAdds;


@end
@implementation CellOfAdds

- (void)awakeFromNib {
    // Initialization code
}

- (void)passModle:(Model *)model {

    self.label_title.text = model.title;
    NSURL *url = [NSURL URLWithString:model.imgsrc];
    [self.imgViewAdds sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1.jpg"] options:SDWebImageProgressiveDownload];
    NSLog(@"%@",model.title);

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
