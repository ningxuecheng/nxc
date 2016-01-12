//
//  LabelWithBtn.m
//  UI04_HOMEWORK
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "LabelWithBtn.h"

@implementation LabelWithBtn

- (void)dealloc {
    [_label release];
    [super dealloc];

}
- (void)showInfo {

    NSLog(@"已经点击");

}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width / 3, frame.size.height)];
        
        [self addSubview:self.label];
        [self.label release];
        
    }
    return self;


}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.delegate showInfo];

}
@end
