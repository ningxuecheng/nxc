//
//  CellOfCustom.h
//  UI14_TableView_自定义cell代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellOfCustom;
@protocol CellOfCustomDetagate <NSObject>

- (void)handleDelAction:(CellOfCustom *)cell;

@end

@interface CellOfCustom : UITableViewCell


@property (nonatomic, retain) UILabel *label_title;
@property (nonatomic, assign) id<CellOfCustomDetagate> delegate;
@end
