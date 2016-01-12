//
//  LTView.m
//  UI93_desin_View
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "LTView.h"

@implementation LTView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/** 因为LTView类在外部使用时,使用父类initwithFrame:方法初始化,因为重写这个方法
    目的: 创建两个子控件
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self){
    
    /** 创建子视图*/
        self.labelOfLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
        
        self.textOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width / 3 * 2, frame.size.height)];
        
    /** 添加到对象上, 引用计数减1*/
        self.labelOfLeft.backgroundColor = [UIColor redColor];
       
        self.textOfRight.borderStyle = UITextBorderStyleRoundedRect;
        
        
        [self addSubview:self.labelOfLeft];
        [_labelOfLeft release];
        [self addSubview:self.textOfRight];
        [_textOfRight release];
    }
    
    
    
    return self;
}

- (void)dealloc {
    [_textOfRight release];
    [_labelOfLeft release];
    [super dealloc];


}

@end
