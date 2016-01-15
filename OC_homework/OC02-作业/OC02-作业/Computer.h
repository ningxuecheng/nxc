//
//  Computer.h
//  OC02-作业
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Computer : NSObject

@property(nonatomic, retain)   NSString *name;
@property(nonatomic, retain)   NSString *color;
@property(nonatomic, assign)    float price;



-(instancetype)initWithName:(NSString *)name
                      color:(NSString *)color
                      price:(float)price;
+(instancetype)computerWithName:(NSString *)name
                          color:(NSString *)color
                          price:(float)price;

@end
