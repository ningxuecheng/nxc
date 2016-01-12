//
//  DengView.h
//  UI04HOME_DENG
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DengView;
@protocol DengViewDelegate <NSObject>

- (void)changeColor:(DengView *)view;

@end
@interface DengView : UIView

//@property (nonatomic, retain) UIView *backView;
@property (nonatomic, assign)id<DengViewDelegate> delegate;

@end
