//
//  Touch.m
//  UI28_TARGET_ACTION
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Touch.h"


@interface Touch()


//声明两个属性 分别为target action
@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;
@end

@implementation Touch

#pragma mark - 知识点 target/action设计模式

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//target 去执行action方法
   
    [self.target performSelector:self.action withObject:self afterDelay:0];

}
- (void)addTarget:(id)target action:(SEL)action {
    self.target = target;
    self.action = action;


}


@end
