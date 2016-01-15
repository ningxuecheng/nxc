//
//  Contact.h
//  OC05-集合
//
//  Created by dllo on 15/12/4.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *sex;
@property(nonatomic, retain)NSString *phnum;
@property(nonatomic, retain)NSString *address;
@property(nonatomic, retain)NSString *group;
@property(nonatomic, assign)NSInteger age;

- (instancetype)initWithName:(NSString *)name
                       Phnum:(NSString *)phnum;

- (void)info;

@end
