//
//  DragView.m
//  UI_nike_bride
//
//  Created by dllo on 15/12/19.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "DragView.h"

@implementation DragView
{

    CGPoint startLocation;

}

- (instancetype)initWithImage:(UIImage *)anImage {

    self = [super initWithImage:anImage];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    startLocation = [[touches anyObject] locationInView:self];
    [self.superview bringSubviewToFront:self];


}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint pt = [[touches anyObject] locationInView:self];
    float dx = pt.x - startLocation.x;
    float dy = pt.y - startLocation.y;
    CGPoint newcenter = CGPointMake(self.center.x + dx, self.center.y + dy);
    self.center = newcenter;



}
@end
