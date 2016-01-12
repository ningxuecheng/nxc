//
//  CellOfNews.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfNews.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
@interface CellOfNews ()
@property (weak, nonatomic) IBOutlet UIImageView *imageOFNews;
@property (weak, nonatomic) IBOutlet UILabel *label_title;
@property (weak, nonatomic) IBOutlet UILabel *label_word;
@property (retain, nonatomic) NSString *url;
@property (retain, nonatomic) NSString *docid;
@property (retain, nonatomic) NSString *strImg;
@property (retain, nonatomic) NSMutableArray *arrData;
@property (weak, nonatomic) IBOutlet UILabel *label_count;

@end
@implementation CellOfNews


- (void)awakeFromNib {
    //file
   
    
    
    
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)passModel:(Model *)model {

    self.label_title.text = model.title;
    self.label_word.text = model.digest;
    self.label_word.numberOfLines = 0;
    self.url = model.url;
    self.strImg = model.imgsrc;
    NSURL *url = [NSURL URLWithString:model.imgsrc];
    [self.imageOFNews sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1.jpg"] options:SDWebImageProgressiveDownload];
}
@end
