//
//  DataBaseHandler.h
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/12.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;
@interface DataBaseHandler : NSObject
+ (instancetype)shareDataBaseHandler;
- (void)open;
- (void)insertMark:(Model *)model;
- (void)closeDB;
- (void)deleteWithTitle:(NSString *)title;
@end
