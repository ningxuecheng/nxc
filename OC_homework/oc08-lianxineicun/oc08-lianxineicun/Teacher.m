//
//  Teacher.m
//  oc08-lianxineicun
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Teacher.h"
#import "Student.h"
@implementation Teacher

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                     myclass:(NSString *)myclass {
    
    self = [super init];
    if (self) {
        self.name = [name copy];
        self.age = age;
        self.myclass = [myclass copy];
    }
    return self;
    
}



- (void)addValue:(NSMutableArray *)arr {
    
    for (Student *stu in arr) {
        int a = arc4random() % (100 - 50 + 1) + 50;
        NSString *str = [NSString stringWithFormat:@"%d",a];
        [stu.dicStudy setObject:str forKey:@"chinese"];
    }
    
    
}
- (void)dealloc {

    [_myclass release];
    [super dealloc];


}

@end
