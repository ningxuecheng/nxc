//
//  ToolItem.h
//  Project_A
//
//  Created by dllo on 16/1/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolItemDelegate <NSObject>

- (void)DidPushWed:(NSString *)str;

@end
@interface ToolItem : UICollectionViewCell
@property (nonatomic, assign) id<ToolItemDelegate> delegate;
@end
