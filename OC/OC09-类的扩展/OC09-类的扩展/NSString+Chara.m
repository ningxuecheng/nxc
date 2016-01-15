//
//  NSString+Chara.m
//  OC09-类的扩展
//
//  Created by dllo on 15/12/10.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "NSString+Chara.h"

@implementation NSString (Chara)

- (NSString *)chara {

   return [self substringToIndex:1].uppercaseString;


}

@end
