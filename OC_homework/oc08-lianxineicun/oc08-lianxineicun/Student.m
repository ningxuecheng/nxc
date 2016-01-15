//
//  Student.m
//  oc08-lianxineicun
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Student.h"

@implementation Student

 
- (NSComparisonResult)compareAge:(Student *)stu {

    if (self.age > stu.age) {
        return NSOrderedDescending;
    }if (self.age < stu.age) {
        return NSOrderedAscending;
    }else{
        return NSOrderedSame;
    }


}

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                      number:(NSString *)nsmber {

    self = [super init];
    if (self) {
        self.name = [name copy] ;
        self.age = age;
        self.number = [nsmber copy];
    }
    
    self.dicStudy = [[NSMutableDictionary dictionary] copy];
    
    return [self autorelease];


}
- (void)dealloc {


    [_dicStudy release];
    [_number release];
    
    [super dealloc];



}

@end
