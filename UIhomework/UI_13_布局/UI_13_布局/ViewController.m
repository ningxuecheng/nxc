//
//  ViewController.m
//  UI_13_布局
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self tableViewSubViews];
    
    
}

- (void)tableViewSubViews {
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool1"];
    
    
    [_tableView release];


}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];

   
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 150;
}

- (void)handleData {

    self.array = @[@"dasd",@"asdweq",@"zxc",@"sad"];
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
