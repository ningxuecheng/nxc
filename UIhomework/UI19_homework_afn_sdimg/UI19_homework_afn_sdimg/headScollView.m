//
//  headScollView.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "headScollView.h"
#import "UIImageView+WebCache.h"
#import "ModleTitle.h"
@interface headScollView ()
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) NSArray *array;

@end


@implementation headScollView

- (instancetype)initWithFrame:(CGRect)frame arr:(NSArray *)arr {
    self = [super initWithFrame:frame];
    if (self) {
        
    }

    return self;

}

- (void)createImageView:(CGRect)frame {
    for (int i = 0; i < self.array.count; i ++) {
        ModleTitle *mod = [self.array objectAtIndex:i];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height)];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        NSURL *url = [NSURL URLWithString:mod.imgsrc];
        [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1.jpg"] options:SDWebImageProgressiveDownload];
        imgView.frame = CGRectMake(5, 50, frame.size.width, frame.size.height - 50);
        
    }
  






}
- (void)ceateScroll:(CGRect)frame {
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:self.scroll];
    
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    
    self.scroll.contentSize = CGSizeMake(self.frame.size.width * self.array.count, frame.size.height);
    [self createImageView:frame];
    
    self.scroll.pagingEnabled = YES;
    self.scroll.bounces = YES;
}

@end
