//
//  ViewController.m
//  UI27_homework_MJRef
//
//  Created by dllo on 16/1/19.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "/Users/dllo/Desktop/nxc/UIhomework/UI27_homework_MJRef/Pods/AFNetworking/AFNetworking/AFURLSessionManager.h"
#import "CellOfNews.h"
#import <MJRefresh/MJRefresh.h>
#import "WebVC.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
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
   
    [self createTableView];
    
}

#pragma mark - 数据处理
- (void)handleData {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSArray *arrNews = [responseObject objectForKey:@"T1348647853363"];
            self.array = [NSMutableArray array];
            
            for (NSDictionary *dic in arrNews) {
               
                Model *model = [[Model alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.array addObject:model];
                [model release];
               
            }
            [self.tableView reloadData];
            // 隐藏当前的上拉刷新控件
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }
        
    
    }];
    [dataTask resume];
    
}
#pragma mark - 创建tableView
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"CellOfNews" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"poolCell"];
    
    [self.tableView headerViewForSection:1];
    UIImageView *v_headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 23)];//创建一个UIimageView（v_headerImageView）
    v_headerImageView.backgroundColor = [UIColor redColor];
    
    
    self.tableView.tableHeaderView = v_headerImageView;
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self handleData];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self handleData];
    }];
  
    [self.tableView.mj_header beginRefreshing];
    
    [_tableView release];
}

#pragma mark - 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.array.count;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"poolCell"];
    Model *mod = [self.array objectAtIndex:indexPath.row];
    [cell passModel:mod];
     return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}
/** 返回区头*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v_headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)] autorelease];//创建一个视图（v_headerView）
    if (section == 0) {
        v_headerView.backgroundColor = [UIColor blackColor];
    }
    if (section == 1) {
        v_headerView.backgroundColor = [UIColor greenColor];
    }
    return v_headerView;//将视图（v_headerView）返回
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *model = [self.array objectAtIndex:indexPath.row];
    WebVC *vc = [[WebVC alloc] init];
    [vc passModel:model];
    
    
    [UIView  beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [self.navigationController pushViewController:vc animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    [vc release];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
