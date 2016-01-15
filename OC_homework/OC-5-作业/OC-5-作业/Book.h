//
//  Book.h
//  OC-5-作业
//
//  Created by dllo on 15/12/4.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject


@property(nonatomic, retain)NSString *name;
@property(nonatomic, assign)float price;


- (instancetype)initWithName:(NSString *)name
                       price:(float )price;

- (void)info;



@end
