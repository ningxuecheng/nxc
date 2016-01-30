//
//  GuidOfItem.m
//  Project_A
//
//  Created by dllo on 16/1/28.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "GuidOfItem.h"
#import "ModelOfGuide.h"
@interface GuidOfItem ()
@property (nonatomic, retain) UILabel *label_name;
@end

@implementation GuidOfItem
- (void)dealloc {
    [_label_name release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //self.contentView.backgroundColor = [UIColor redColor];
        [self createViews];
    }

    return self;
}

- (void)passAnyModel:(id)model {
    ModelOfGuide *guide = model;
    self.label_name.text = guide.title;
    self.label_name.textAlignment = 1;

}
- (void)createViews {
    self.label_name = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.label_name];
    [_label_name release];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label_name.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);

}

@end
