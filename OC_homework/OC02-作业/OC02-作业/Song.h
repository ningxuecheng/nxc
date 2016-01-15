//
//  Song.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property(nonatomic, retain)    NSString *name;
@property(nonatomic, retain)    NSString *singer;
@property(nonatomic, retain)    NSString *date;


-(instancetype)initWithName:(NSString *)name
                     singer:(NSString *)singer
                       date:(NSString *)date;
+(instancetype)songWithName:(NSString *)name
                     singer:(NSString *)singer
                       date:(NSString *)date;

@end
