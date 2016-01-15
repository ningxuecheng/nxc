//
//  Pen.h
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pen : NSObject

@property(nonatomic, retain)    NSString *name;
@property(nonatomic, retain)    NSString *color;
@property(nonatomic, assign)    NSInteger size;



-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                       size:(NSInteger)size;
+(instancetype)penWithName:(NSString *)name
                     color:(NSString *)color
                      size:(NSInteger)size;

@end
