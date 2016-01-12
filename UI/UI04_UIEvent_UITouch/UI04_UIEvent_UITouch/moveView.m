//
//  moveView.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "MoveView.h"

@implementation MoveView
{
   CGPoint startLocation;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    startLocation = [[touches anyObject] locationInView:self];
    [self.superview bringSubviewToFront:self];//为什模是父视图
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    CGPoint pt = [[touches anyObject] locationInView:self];
    float dx = pt.x - startLocation.x;
    float dy = pt.y = startLocation.y;
    CGPoint newcenter = CGPointMake(self.center.x + dx, self.center.y + dy);

    self.center = newcenter;
}


@end

