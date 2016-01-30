//
//  TravelCell.h
//  Project_A
//
//  Created by dllo on 16/1/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TravelCellDelegate <NSObject>

- (void)travelCellDidSelectedItemPushVC:(NSString *) strURL;

@end

@interface TravelCell : UICollectionViewCell

@property (nonatomic, assign) id<TravelCellDelegate> delegate;

- (void)passURL:(NSString *)url;


@end
