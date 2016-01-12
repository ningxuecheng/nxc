//
//  ViewController.m
//  UI16_homework
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellContacts.h"
#import "Contacts.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation ViewController
- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"第一页";
    [self handleData];
    [self createTableView];
}
- (void)handleData {
    self.array = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
      for (NSString *key in dic) {
         
          /** 取出数组 例：A[]数组*/
          NSMutableArray *array = [dic objectForKey:key];
          /** 便利数组取出字典*/
        for (NSDictionary *condic in array) {
            Contacts *con = [[Contacts alloc] init];
            [con setValuesForKeysWithDictionary:condic];
            [self.array addObject:con];
            [con release];
        }
    }
    
    NSLog(@"%@",self.array);

}
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];

    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CellContacts class] forCellReuseIdentifier:@"pool1"];
    [_tableView release];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellContacts *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];

    [cell passModel:self.array[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
