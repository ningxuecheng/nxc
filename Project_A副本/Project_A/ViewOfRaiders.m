//
//  ViewOfRaiders.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewOfRaiders.h"

@interface ViewOfRaiders ()
@end

@implementation ViewOfRaiders

- (instancetype)initWithFrame:(CGRect)frame img:(NSString *)img title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self createViewsWith:img title:title];
       // self.backgroundColor = [UIColor orangeColor];
    }
    
    return self;

}

- (void)createViewsWith:(NSString *)img title:(NSString *)title {

    UIImageView *imgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:img]];
//   imgview.frame = CGRectMake(15, 5, self.frame.size.width - 30, 40);
     imgview.frame = CGRectMake(15, 5, 32, 32);
    [self addSubview:imgview];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 55,       self.frame.size.width - 30, 20)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    [imgview release];
    [label release];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.block();
}

@end
