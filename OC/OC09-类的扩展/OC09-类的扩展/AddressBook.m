//
//  AddressBook.m
//  OC09-类的扩展
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AddressBook.h"
#import "Person.h"
#import "NSString+Chara.h"
/** 
  * 类的延展, 注意延展后边的 () 里面是空的.
  * 类的延展里面和 .h 文件 写法一样.
  * 延展里面的属性 外部看不到.
  */

@interface AddressBook ()

@property(nonatomic, retain)NSMutableDictionary *dic;


@end


/** 方法的实现部分 */
@implementation AddressBook
- (instancetype)init {

    self = [super init];
    self.dic = [NSMutableDictionary dictionary];
    return self;
}

- (void)addContact:(Person *)per {

    NSString *group = [per.name chara];
    
    NSMutableArray *arr = [self.dic objectForKey:group];
    if (arr == nil) {
        arr = [NSMutableArray array];
        [arr addObject:per];
        [self.dic setObject:arr forKey:group];
    }else{
      
        [arr addObject:per];
        
    }
    


}


@end
