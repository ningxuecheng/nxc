//
//  DatabaseHandler.h
//  UI21_SQLite
//
//  Created by dllo on 16/1/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Students;
@interface DatabaseHandler : NSObject
+ (instancetype)shareDataBaseHandler;
- (void)open;
- (void)createTable;
- (void)insertStudent:(Students *)stu;
- (void)updataStudent:(Students *)stu forNumber:(NSInteger)number;

- (void)deleteWithNumber:(NSInteger)number;
- (NSArray *)selectForAge:(int)age;
- (void)dropTable;
- (void)closeDB;
@end
