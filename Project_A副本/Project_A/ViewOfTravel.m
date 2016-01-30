//
//  ViewOfTravel.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewOfTravel.h"

@implementation ViewOfTravel


- (instancetype)initWithFrame:(CGRect)frame title:(NSString *) title {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lable = [[UILabel alloc] initWithFrame:self.bounds];
        lable.text = title;
        lable.textAlignment = 1;
        [self addSubview:lable];
        [lable release];
        
    }

    return self;

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 self.block();
}


@end
