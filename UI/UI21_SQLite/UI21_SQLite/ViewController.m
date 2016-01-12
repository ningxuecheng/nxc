//
//  ViewController.m
//  UI21_SQLite
//
//  Created by dllo on 16/1/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseHandler.h"
#import "Students.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)openSQL:(id)sender {
    NSLog(@"%@",NSHomeDirectory());
    [[DatabaseHandler shareDataBaseHandler] open];
    
    
}
- (IBAction)createTable:(id)sender {
    [[DatabaseHandler shareDataBaseHandler] createTable];
    
}
- (IBAction)handleInsert:(id)sender {
    Students *stu = [[Students alloc] init];
    stu.name = @"zhangsan";
    stu.age = 18;
    stu.sex = @"male";
    
    [[DatabaseHandler shareDataBaseHandler] insertStudent:stu];
    
    
}

- (IBAction)handleUpdate:(id)sender {
    Students *stu = [[Students alloc] init];
    stu.name = @"lisi";
    stu.age = 20;
    stu.sex = @"female";
    
    [[DatabaseHandler shareDataBaseHandler] updataStudent:stu forNumber:1];
    
}

- (IBAction)handleDELETE:(id)sender {
    
    [[DatabaseHandler shareDataBaseHandler] deleteWithNumber:1];
}

- (IBAction)handleSELECT:(id)sender {
   NSArray *arr = [[DatabaseHandler shareDataBaseHandler] selectForAge:18];
    NSLog(@"%@",arr);
}

- (IBAction)handleDROP:(id)sender {

    [[DatabaseHandler shareDataBaseHandler] dropTable];

}

- (IBAction)closeDB:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
