//
//  ViewOfTool.m
//  Project_A
//
//  Created by dllo on 16/1/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewOfTool.h"

@interface ViewOfTool ()
@property (nonatomic, retain) NSString *str;
@end

@implementation ViewOfTool

- (void)dealloc {
    [_str release];
    [super dealloc];

}

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Img:(NSString *)img {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:img]];
        imgView.frame = CGRectMake((frame.size.width - 64)/2, (frame.size.height - 64)/2, 64, 64);
        [self addSubview:imgView];
        [imgView release];
        
        UILabel *label_title = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width - 64)/2, (frame.size.height - 64)/2 + 5 + 64, 64, 40)];
        label_title.textAlignment = 1;
        label_title.text = title;
        [self addSubview:label_title];
        [label_title release];
        self.str = title;
        
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate DidPushWedMap:self.str];

}

@end
