//
//  InfoItem.h
//  Project_A
//
//  Created by dllo on 16/1/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoItemDelegate <NSObject>

- (void)DidSelectedItemPushVC:(NSString *) strURL;

@end
@interface InfoItem : UICollectionViewCell

@property (nonatomic, assign) id<InfoItemDelegate> delegate;


- (void)passURL:(NSString *)strURL;
@end
