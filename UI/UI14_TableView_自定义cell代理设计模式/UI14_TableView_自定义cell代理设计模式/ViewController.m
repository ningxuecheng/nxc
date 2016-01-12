//
//  ViewController.m
//  UI14_TableView_自定义cell代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellOfCustom.h"
#import "Second.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource,CellOfCustomDetagate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];

}

- (void)nextAction:(UIBarButtonItem *) item {
    Second *sec = [[Second alloc] init];
    [self.navigationController pushViewController:sec animated:YES];
    [sec release];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self tableviewSubView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(nextAction:)];
    
}

- (void)tableviewSubView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[CellOfCustom class] forCellReuseIdentifier:@"pool1"];
    
    
    [_tableView release];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {


    return 100;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfCustom *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    cell.delegate = self;
    cell.label_title.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark - 实现协议方法
/** 删除cell*/
- (void)handleDelAction:(CellOfCustom *)cell {
   
    NSLog(@"ddd");
   NSIndexPath *index = [self.tableView indexPathForCell:cell];
    
    NSLog(@"%ld %ld",index.section,index.row);
    
    // 数据
    [self.array removeObjectAtIndex:index.row];
    
    // ui
    
    [self.tableView deleteRowsAtIndexPaths:@[index] withRowAnimation:YES];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"dad");
}


- (void)handleData {
    self.array = @[@"zhang",@"wang",@"wu",@"li",@"zhou"].mutableCopy;

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
