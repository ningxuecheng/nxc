//
//  AddressBook.m
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

/** 重写init方法 目的属性数组初始化*/
- (instancetype)init {
    self = [super init];
    if (self) {
        self.arr = [NSMutableArray array];
    }
    return self;
}




- (void)addContact:(Contact *)per1 {
    
     
    /** 联系人参数添加倒数组中*/
    [self.arr addObject:per1];



}

- (void)listAllContact {

 /** 便利数组 */
    
    
    for (Contact *con in self.arr) {
        NSLog(@"name%@,add%@,phone%@",con.name,con.address,con.phone);
    }
 
}



- (void)delCon:(Contact *)per {
      /** 从数组中删除*/
    [self.arr removeObject:per];

}

- (void)delCon2:(Contact *)per {

    
    NSMutableArray *tempArr = [NSMutableArray array];
    
    for (Contact *con in self.arr) {
        if ([con.name isEqualToString:per.name]) {
            [tempArr addObject:con];
            
        }
    }

    [self.arr removeObjectsInArray:tempArr];

}


@end
