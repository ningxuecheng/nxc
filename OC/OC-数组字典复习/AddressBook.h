//
//  AddressBook.h
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface AddressBook : NSObject


/** 用于存放联系人对象的数组 */
@property (nonatomic, retain)NSMutableArray * arr;


#pragma mark - 功能
/** 功能 */

/** 1.添加联系人 */

- (void)addContact:(Contact *)per1;


/** 2.显示所有联系人*/

- (void)listAllContact;


/** 3.删除联系人*/

- (void)delCon:(Contact *)per;
- (void)delCon2:(Contact *)per;









@end
