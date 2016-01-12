//
//  SecondViewController.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "CellForImageTableViewCell.h"
@interface SecondViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *array;

@end

@implementation SecondViewController

- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self tableViewSubview];
    
}


- (void)tableViewSubview {

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[CellForImageTableViewCell class] forCellReuseIdentifier:@"pool1"];
    [_tableView release];
    

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CellForImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    cell.imageForPic.image = [UIImage imageNamed:[self.array objectAtIndex:indexPath.row]];
    
    
    return cell;
}


/** 返回每一行的高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
  /** 从数组中取出字符串 */
    NSString *name = [self.array objectAtIndex:indexPath.row];
    /** 调用cell的方法，计算高度 */
    
    return [CellForImageTableViewCell heightImageView:name];
}

- (void)handleData {

    self.array = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
