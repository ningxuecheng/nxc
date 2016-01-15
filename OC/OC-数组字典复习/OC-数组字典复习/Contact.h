//
//  Contact.h
//  OC-数组字典复习
//
//  Created by dllo on 15/12/7.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *phone;
@property(nonatomic, retain)NSString *address;
@property(nonatomic, retain)NSString *group;


- (instancetype)initWName:(NSString *)name
                    phone:(NSString *)phone
                  address:(NSString *)add;
                   

@end
