//
//  AddressBookV2.m
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AddressBookV2.h"

@implementation AddressBookV2


- (instancetype)init {

    self = [super init];
    if (self) {
        self.dic = [NSMutableDictionary dictionary];
    }
    return self;

}


- (void)addContact:(Contact *)per {

  /** 添加到字典中相应分组的数组中 */
    
    /** 获得联系人组名 */
    NSString *key = per.group;
    
    /** 根据key在字典中获取对应的数组 */
    NSMutableArray *arr = [self.dic objectForKey:key];
    
    
    /** 判断arr 为空 说明没有此分组*/
    if (arr == nil) {
        
        /** 创建 key value 对添加到字典中*/
        NSMutableArray *arr = [NSMutableArray array];
        
        [arr addObject:per];
        [self.dic setObject:arr forKey:key];
        
        
    }else {
        /** 如果联系人不为空 */
    
        /** 将参数联系人添加到数组中 **/
        [arr addObject:per];

    
    }
 
}
- (void)listAllobj {

    

    for (NSString *key in self.dic ) {
        
        /** 指向key所对应的数组*/
        NSMutableArray *dicarr = [self.dic objectForKey:key];
        
        
        for (Contact *con in dicarr) {
            NSLog(@"name%@ phone%@ add%@",con.name,con.phone,con.address);
        }
        
        
        
    }
    

}


- (void)listCobj:(NSString *)group {
    
    NSMutableArray *marr = [self.dic objectForKey:group.uppercaseString];
    for (Contact *con in marr) {
        NSLog(@"NAME%@ PHONE%@ ADD%@",con.name,con.phone,con.address);
    }
    
    
    
}






@end
