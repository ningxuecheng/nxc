//
//  Mother.h
//  OC09-代理设计模式
//
//  Created by dllo on 15/12/11.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

/***/
@protocol BaoMuDelegate <NSObject>

/** 看孩子 */
@required

- (void)takecareChild;

/** 做饭 */

- (void)cooking;

@optional
/** 洗衣服 */

- (void)washing;

@end

@interface Mother : Person


/** 声明delegate属性 */
@property(nonatomic, assign) id<BaoMuDelegate> delegate;

- (void)payMoney;



@end
