//
//  VCForTableViewController.m
//  UI18_homework_URLSession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "VCForTableViewController.h"
#import "NetClass.h"
#import "Model.h"

@interface VCForTableViewController () <UITableViewDataSource,UITableViewDelegate,NetClassDelegate>
@property (retain, nonatomic)  UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) id str;

@end

@implementation VCForTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleArr];
    self.tableView.backgroundColor = [UIColor grayColor];
    [self TableView];
}
- (void)TableView{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSLog(@"%s",__FUNCTION__);
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
   Model *mod = self.array[indexPath.row];
    cell.textLabel.text = mod.title;
      NSLog(@"%s",__FUNCTION__);
    return cell;
    
}

- (void)handleArr {
    NetClass *net = [[NetClass alloc] init];
    net.delegate = self;
    [net passNet:@"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"];
      NSLog(@"%s",__FUNCTION__);
    
}
- (void)returnArr:(id)result {
    //NSLog(@"%@",result);
    NSArray *array = [NSArray array];
    self.array = [NSMutableArray array];
    
   array = [result objectForKey:@"newsList"];
//    NSLog(@"%@",array);
    for (NSDictionary *dic in array) {
        Model *mod = [[Model alloc] init];
        
        [mod setValuesForKeysWithDictionary:dic];
        [self.array addObject:mod];
    }
    
    NSLog(@"%s",__FUNCTION__);
    
    [self.tableView reloadData];//更新数据
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
