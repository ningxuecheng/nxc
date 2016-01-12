//
//  DatabaseHandler.m
//  UI21_SQLite
//
//  Created by dllo on 16/1/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "DatabaseHandler.h"
#import <sqlite3.h>
#import "Students.h"
@implementation DatabaseHandler

#pragma mark - 知识点1 单例
+ (instancetype)shareDataBaseHandler {
   //在静态区 在静态区只初始化一次
   static DatabaseHandler *dataBase = nil;
    if (dataBase == nil) {
        dataBase = [[DatabaseHandler alloc] init];
    }
    return dataBase;
}
#pragma mark - 知识点2：打开数据库
//定义一个sqlite结构体(对象)
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
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"student.sqlite"];
   int result = sqlite3_open(file.UTF8String, &db);
    if (result == SQLITE_OK) {
        NSLog(@"isopen");
    }else {
        NSLog(@"失败%d",result);
    }
}
#pragma mark - 知识点3 创建表格
- (void)createTable {
  //API:sqlite3_exec;
  //创建SQL语句
    NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS lanou1130(number INTEGER PRIMARY KEY AUTOINCREMENT , name text, sex text, age int)";
   int result = sqlite3_exec(db, createTableSQL.UTF8String, nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"创建表成功");
    }else {
    
        NSLog(@"失败，%d",result);
    }
}
#pragma mark - 知识点4 插入语句
- (void)insertStudent:(Students *)stu {

    //API:SQLITE_EXEC
    
    NSString *insert = [NSString stringWithFormat:@"INSERT into lanou1130(name,sex,age) VALUES('%@','%@','%d')",stu.name,stu.sex,stu.age];
    int result = sqlite3_exec(db, insert.UTF8String, nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"插入成功");
    } else {
         NSLog(@"插入失败%d",result);
    }

}
#pragma mark - 知识点5 更新数据
- (void)updataStudent:(Students *)stu forNumber:(NSInteger)number {
      //API:sqlite_exec
    NSString *string = [NSString stringWithFormat:@"UPDATE lanou1130 SET name = '%@', sex = '%@',age = '%d' WHERE number = '%ld'",stu.name,stu.sex,stu.age,number];
    int result = sqlite3_exec(db, string.UTF8String, nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"update");
    } else {
    
        NSLog(@"失败");
    }
}
#pragma mark - 知识点6 删除数据
- (void)deleteWithNumber:(NSInteger)number {
    //API
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM lanou1130 WHERE number = '%ld'",number];
    int result = sqlite3_exec(db, deleteSQL.UTF8String, nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除失败");
    }
}
#pragma mark - 知识点7 查询数据
- (NSArray *)selectForAge:(int)age {
    //次南方符合条件的数据（元素师model对象）
    NSMutableArray *arr = [NSMutableArray array];
    //sql语句
    NSString *string = [NSString stringWithFormat:@"SELECT *FROM lanou1130 WHERE age = '%d'",age];
    //API:stmt结构体，sqlite3_prepareV2,sqlite3_step.sqlite3_column.
    //声明一个结构体stmt对象（结构体）
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare_v2(db, string.UTF8String, -1, &stmt, nil);
    if (result == SQLITE_OK) {
        NSLog(@"准备就绪");
        //每行都执行查询语句
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //如果查询条件匹配，通过sqlite3_column函数簇 取出值
            //取出哪一列的值
          const unsigned char *name = sqlite3_column_text(stmt, 1);
          const unsigned char *sex =sqlite3_column_text(stmt, 2);
            int age =sqlite3_column_int(stmt, 3);
          //创建model对象，赋值之后放入数组中
            Students *stu = [[Students alloc] init];
            stu.name = [NSString stringWithUTF8String:(const char *)name];
            stu.sex = [NSString stringWithUTF8String:(const char *)sex];
            stu.age = age;
            [arr addObject:stu];
        }
        //销毁对象
        sqlite3_finalize(stmt);
    } else {
        NSLog(@"不能正常查询 %d",result);
        //销毁对象
        sqlite3_finalize(stmt);
    }
    return arr;
}
#pragma mark - 知识点8 删除表单
- (void)dropTable {
 NSString *dropSTRING = @"DROP TABLE lanou1130";
    int result = sqlite3_exec(db, dropSTRING.UTF8String, nil, nil, nil);
    if (result == SQLITE_OK) {
        NSLog(@"删除表格成功");
    } else {
        NSLog(@"删除表格失败");
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
