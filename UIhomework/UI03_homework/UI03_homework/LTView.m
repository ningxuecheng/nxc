//
//  LTView.m
//  UI03_homework
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (instancetype)initWithFrame:(CGRect)frame {
    
    
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
        self.labelOfLeft.textColor = [UIColor whiteColor];
        [self addSubview:self.labelOfLeft];
        [self.labelOfLeft release];
        self.textOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width / 3 * 2, frame.size.height)];
        self.textOfRight.borderStyle = 3;
        [self addSubview:self.textOfRight];
        [self.textOfRight release];
    }
    
    return self;
    
}

- (void)dealloc {
    [_labelOfLeft release];
    [_textOfRight release];
    [super dealloc];
    
    
}

@end
