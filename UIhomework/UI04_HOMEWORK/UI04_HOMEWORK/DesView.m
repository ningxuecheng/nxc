//
//  DesView.m
//  UI04_HOMEWORK
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "DesView.h"

@implementation DesView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (self.backgroundColor == [UIColor blueColor]) {
        
        self.backgroundColor = [UIColor greenColor];
        return;
    }
    self.backgroundColor = [UIColor blueColor];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.backgroundColor == [UIColor greenColor]) {
        
        self.frame = CGRectMake(50, 50, self.frame.size.width / 2,self.frame.size.height / 2);
       
        return;
    }
   


    self.frame = CGRectMake(50, 50, self.frame.size.width * 2, self.frame.size.height * 2);

}
@end
