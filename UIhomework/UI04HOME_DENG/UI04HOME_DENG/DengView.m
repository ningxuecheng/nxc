//
//  DengView.m
//  UI04HOME_DENG
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "DengView.h"

@implementation DengView




- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
          [self.delegate changeColor:self];
    
}

@end
