//
//  TouchView.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView


- (void)dealloc {
    [_textFieldCont release];
    [super dealloc];

}


- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.textFieldCont = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, frame.size.height)];
        
        [self addSubview:self.textFieldCont];
        self.textFieldCont.borderStyle = 3;
        [_textFieldCont release];
    }
    return self;

}


/** 重写Touch相关方法 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"开始触摸");


}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"移动");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate changeColor];
    NSLog(@"移动结束");
}
@end
