//
//  Teacher.h
//  oc08-lianxineicun
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Person.h"

@interface Teacher : Person

@property(nonatomic, retain)NSString *myclass;


- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                     myclass:(NSString *)myclass;


- (void)addValue:(NSMutableArray *)arr;

@end
