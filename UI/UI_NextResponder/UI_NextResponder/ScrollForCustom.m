//
//  ScrollForCustom.m
//  UI_NextResponder
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ScrollForCustom.h"

@implementation ScrollForCustom

/** 重写touch相关方法. */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//下一响应者
    [[self nextResponder] touchesBegan:touches withEvent:event];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //下一响应者
    [[self nextResponder] touchesBegan:touches withEvent:event];


}

@end
