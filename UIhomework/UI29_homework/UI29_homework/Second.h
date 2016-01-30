//
//  Second.h
//  UI29_homework
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondDelegate <NSObject>

- (void)passValue:(NSString *)string;

@end

@interface Second : UIViewController

@property (nonatomic, assign) id<SecondDelegate> delegate;
@property (nonatomic, copy) void (^block)(NSString *);
@end
