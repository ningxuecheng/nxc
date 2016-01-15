//
//  Phone.h
//  OC03-属性
//
//  Created by dllo on 15/12/2.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject

@property (nonatomic, retain)NSString *log;
@property (nonatomic, assign)float size;
@property (nonatomic, retain)NSString *color;

- (instancetype)initWithLog:(NSString *)log
                      size:(float)size
                      color:(NSString *)color;
+ (instancetype)phoneWithlog:(NSString *)log
                       size:(float)size
                      color:(NSString *)color;


- (void)callPhone;
@end
