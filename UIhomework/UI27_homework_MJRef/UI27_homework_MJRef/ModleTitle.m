//
//  ModleTitle.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModleTitle.h"

@implementation ModleTitle

- (void)dealloc {
    [_imgsrc release];
    [_title release];
    [_url release];
    [super dealloc];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
@end
