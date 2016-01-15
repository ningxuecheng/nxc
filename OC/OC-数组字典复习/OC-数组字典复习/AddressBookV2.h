//
//  AddressBookV2.h
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
@interface AddressBookV2 : NSObject
@property(nonatomic, retain)NSMutableDictionary *dic;
/*用于存放联系人的字典**/

- (void)addContact:(Contact *)per;


- (void)listAllobj;


/** 显示某个分组下的全部联系人*/

- (void)listCobj:(NSString *)group;

@end
