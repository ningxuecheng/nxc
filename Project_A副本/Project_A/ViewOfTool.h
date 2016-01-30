//
//  ViewOfTool.h
//  Project_A
//
//  Created by dllo on 16/1/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ViewOfToolDelegate <NSObject>

- (void)DidPushWedMap:(NSString *)str;

@end

@interface ViewOfTool : UIView

@property (nonatomic, assign) id<ViewOfToolDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Img:(NSString *)img;
@end
