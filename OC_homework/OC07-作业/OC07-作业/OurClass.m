//
//  OurClass.m
//  OC07-作业
//
//  Created by dllo on 15/12/9.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "OurClass.h"

@implementation OurClass


- (void)addStu:(Student *)stu {

    [self.stuArr addObject:stu];


}
- (void)minStu:(Student *)stu {

    [self.stuArr removeObject:stu];

}


@end
