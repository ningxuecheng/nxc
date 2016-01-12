//
//  ScrollForCell.m
//  UI14_TableView_自定义cell代理设计模式
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ScrollForCell.h"

@implementation ScrollForCell

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"%@",self.nextResponder.nextResponder.nextResponder.nextResponder);

    [self.nextResponder.nextResponder.nextResponder.nextResponder touchesBegan:touches withEvent:event];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.nextResponder.nextResponder.nextResponder.nextResponder touchesEnded:touches withEvent:event];

}
@end
