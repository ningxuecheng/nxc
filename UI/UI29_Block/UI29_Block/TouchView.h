//
//  TouchView.h
//  UI29_Block
//
//  Created by dllo on 16/1/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIView

/** 方法第一个block参数*/
- (void)viewDidClick:(void(^)(TouchView *view))block;
- (void)buttonHandle:(void(^)(UIButton * deleBtn))block;
- (void)buttonHandle: (void(^)(UIButton * deleBtn))block editBtn:(void(^)(UIButton * editBtn))edit;
@end
