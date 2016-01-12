//
//  DataBaseHandler.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/12.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "DataBaseHandler.h"
#import <sqlite3.h>
#import "Model.h"
@implementation DataBaseHandler

#pragma mark - 数据库存储
#pragma mark - 创建数据库（单例）
+ (instancetype)shareDataBaseHandler {
    //在静态区 在静态区只初始化一次
    static DataBaseHandler *dateBase = nil;
    if (dateBase == nil) {
        dateBase = [[DataBaseHandler alloc] init];
    }
    return dateBase;
}

#pragma mark - 打开数据库
sqlite3 *db;
- (void)open {
    //API: sqlite3_open
    if (db != nil) {
        NSLog(@"数据库已经打开");
        return;
    }
    /**
     @param filename 数据库文件的路径(注意：转换成c字符串)
     @param ppDb 数据库对象
     */
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"collect.sqlite"];
    int result = sqlite3_open(file.UTF8String, &db);
    if (result != SQLITE_OK) {
        NSLog(@"失败%d",result);
    } else {
        DataBaseHandler *datebase = [DataBaseHandler shareDataBaseHandler];
        [datebase createTable];
    }
}
- (void)createTable {
    //API:sqlite3_exec;
    //创建SQL语句
    NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS collect(Id INTEGER PRIMARY KEY AUTOINCREMENT , title text, digest text, url test, imgsrc text, docid text)";
    int result = sqlite3_exec(db, createTableSQL.UTF8String, nil, nil, nil);
    if (result != SQLITE_OK) {
        NSLog(@"失败，%d",result);
    }
}
#pragma mark - 知识点4 插入语句
- (void)insertMark:(Model *)model {
    NSString *insert = [NSString stringWithFormat:@"INSERT into collect(title,digest,url,imgsrc,docid) VALUES('%@','%@','%@','%@','%@')",model.title,model.digest,model.url,model.imgsrc,model.docid];
    int result = sqlite3_exec(db, insert.UTF8String, nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"插入成功");
    } else {
        NSLog(@"插入失败%d",result);
    }
}

#pragma mark - 知识点6 删除数据
- (void)deleteWithTitle:(NSString *)title {
    //API
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM collect WHERE title = '%@'",title];
    int result = sqlite3_exec(db, deleteSQL.UTF8String, nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除失败");
    }
}




#pragma mark - 知识点9 关掉数据库
- (void)closeDB {
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        NSLog(@"管成功");
    }else {
        NSLog(@"管失败");
    }
}

@end
