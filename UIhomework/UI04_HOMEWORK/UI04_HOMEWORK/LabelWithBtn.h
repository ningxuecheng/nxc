//
//  LabelWithBtn.h
//  UI04_HOMEWORK
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LabelWithBtnDelegate <NSObject>

- (void)showInfo;

@end

@interface LabelWithBtn : UIView <LabelWithBtnDelegate>
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, assign)id<LabelWithBtnDelegate> delegate;
@end
