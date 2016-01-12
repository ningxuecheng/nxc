//
//  ViewController.m
//  UI10_TableView_p
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrData;//存放数据
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_arrData release];
    [super dealloc];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)createTableView {
  
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *pool1 = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool1];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:pool1] autorelease];
    }
   
    NSDictionary *dic = [self.arrData objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    cell.detailTextLabel.text = [dic objectForKey:@"detail"];
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    

    return cell;
}


- (void)handleData {
    self.arrData = @[@{@"title":@"zhang",
                       @"detail":@"aaa",
                       @"image":@"1.jpg"},
                     @{@"title":@"zhang2",
                       @"detail":@"aaa",
                       @"image":@"2.jpg"},
                     @{@"title":@"zhang3",
                       @"detail":@"aaa",
                       @"image":@"3.jpg"},
                     @{@"title":@"zhang4",
                       @"detail":@"aaa",
                       @"image":@"4.jpg"},
                     @{@"title":@"zhang5",
                       @"detail":@"aaa",
                       @"image":@"5.png"},
                     
                     
                     ].mutableCopy;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self createTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
