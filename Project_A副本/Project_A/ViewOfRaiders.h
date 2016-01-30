//
//  ViewOfRaiders.h
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewOfRaiders : UIView

@property (nonatomic, copy) void (^block)();

- (instancetype)initWithFrame:(CGRect)frame img:(NSString *)img title:(NSString *)title;

@end
