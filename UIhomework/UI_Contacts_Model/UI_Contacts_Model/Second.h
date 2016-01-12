//
//  Second.h
//  UI_Contacts_Model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondDelegate <NSObject>

- (void)passVal:(NSDictionary *) secDic;

@end

@interface Second : UIViewController

@property (nonatomic, assign)id<SecondDelegate> delegate;


@end
