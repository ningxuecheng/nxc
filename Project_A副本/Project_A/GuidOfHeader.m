//
//  GuidOfHeader.m
//  Project_A
//
//  Created by dllo on 16/1/28.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "GuidOfHeader.h"

@interface GuidOfHeader ()
@property (nonatomic, retain) UIImageView *imgMark;
@end
@implementation GuidOfHeader
- (void)dealloc {
    [_imgMark release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }
    return self;
}

- (void)passNum:(NSString *)number {
    if ([number isEqual:@0]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-gongneng"];
    }
    if ([number isEqual:@1]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-icon"];
    }
    if ([number isEqual:@2]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-daodaceng"];
    }
    if ([number isEqual:@3]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-3"];
    }
    if ([number isEqual:@6]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-zhusu"];
    }
    if ([number isEqual:@7]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-meishi"];
    }
    if ([number isEqual:@8]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-gouwu"];
    }
    if ([number isEqual:@9]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-gerenxinxi"];
    }
    if ([number isEqual:@11]) {
        self.imgMark.image = [UIImage imageNamed:@"iconfont-shenglve"];
    }
    

}
- (void)createViews {
    self.imgMark = [[UIImageView alloc] init];
    [self addSubview:self.imgMark];
    [_imgMark release];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgMark.frame = CGRectMake(15, 8, 32, 32);
}

@end
