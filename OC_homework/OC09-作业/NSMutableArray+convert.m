//
//  NSMutableArray+convert.m
//  OC09-作业
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "NSMutableArray+convert.h"

@implementation NSMutableArray (convert)

- (void)convert {

    for (int i = 0; i < ( self.count / 2); i++) {
        [ self exchangeObjectAtIndex:i withObjectAtIndex:self.count - i - 1 ];
    }
    
    
    
}


@end
