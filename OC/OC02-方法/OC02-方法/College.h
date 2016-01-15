//
//  College.h
//  OC02-方法
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@interface College : Student
{
    NSString *_major;
    NSString *_acodemy;

}
- (void)setMajor:(NSString *) major;
- (NSString *)major;

- (void)setAcodemy:(NSString *) acodemy;
- (NSString *)acodemy;


- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                         sex:(NSString *)sex
                      school:(NSString *)school
                      number:(NSInteger)number
                       major:(NSString *)major
                     acodemy:(NSString *)acodemy;

@end
