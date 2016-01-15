//
//  OurClass.m
//  oc08-lianxineicun
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "OurClass.h"
#import "Teacher.h"
@implementation OurClass


- (void)addStu:(Student *)stu {
    
    [self.stuArr addObject:stu];
    
    
}
- (void)minStu:(Student *)stu {
    
    [self.stuArr removeObject:stu];
    
}

- (void)dealloc {
    [_stuArr release];
    [_tea dealloc];
    [super dealloc];

}




- (id)copyWithZone:(NSZone *)zone {
    
    Teacher *tea = [[Teacher allocWithZone:zone] init];
    
    tea.name = 
    
    
    return tea;
}











@end

