//
//  Person.h
//  OC08-内存2
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>


/** 在 @interface 后面<>签协议 */
@interface Person : NSObject <NSCopying>


@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *sex;
@property(nonatomic, assign)NSInteger age;



@end
