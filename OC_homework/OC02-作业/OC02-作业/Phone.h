//
//  Phone.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject

@property(nonatomic, retain)    NSString *name;
@property(nonatomic, retain)    NSString *type;
@property(nonatomic, retain)    NSString *color;
    



-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                       type:(NSString *)type;
+(instancetype)phoneWithName:(NSString *)name
                       color:(NSString *)color
                        type:(NSString *)type;
@end
