//
//  ViewOfTravel.h
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewOfTravel : UIView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *) title ;

@property (nonatomic, copy) void (^block)();

@end
