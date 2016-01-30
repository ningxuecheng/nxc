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
#import "ModleTitle.h"
#import "CollCell.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface ViewController () <UITableViewDelegate, UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) NSMutableArray *arrHeader;

@property (nonatomic, retain) UICollectionView *collect;
@property (nonatomic, retain) UIScrollView *scroll;

@property (nonatomic, retain) NSTimer *timer;

@end

@implementation ViewController

- (void)dealloc {
    [_arrHeader release];
    [_tableView release];
    [_array release];
    [_scroll release];
    [_timer release];
    [_collect release];
    [super dealloc];

}

- (void)viewDidLoad {
   

    [super viewDidLoad];
   self.edgesForExtendedLayout = UIRectEdgeNone;
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
            //把数组中的第一个移除（作为轮播图）
            [self.array removeObjectAtIndex:0];
            
            self.arrHeader = [NSMutableArray array];
            NSDictionary *dicHead = [arrNews objectAtIndex:0];
            NSArray *arrHead = [dicHead objectForKey:@"ads"];
            
            for (NSDictionary *dic in arrHead) {
                ModleTitle *title = [[ModleTitle alloc] init];
                [title setValuesForKeysWithDictionary:dic];
                [self.arrHeader addObject:title];
                [title release];
            }
            
            [self createHeaderView];
          
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
    
   
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self handleData];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self handleData];
    }];
  
    [self.tableView.mj_header beginRefreshing];
    
    [_tableView release];
}

/** 轮播图 */
- (void)createHeaderView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
    
    /** 红线*/
    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width/5, 2)];
    viewLine.backgroundColor = [UIColor redColor];
    [view addSubview:viewLine];
    [viewLine release];
    
    /** uicollection轮播图 */
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(WIDTH, 173);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 5, WIDTH, 173) collectionViewLayout:flowLayout];
    
    self.collect.delegate = self;
    self.collect.dataSource = self;
    [view addSubview:self.collect];
    self.collect.pagingEnabled = YES;
    [self.collect registerNib:[UINib nibWithNibName:@"CollCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collCell"];
    self.collect.backgroundColor = [UIColor whiteColor];
    
    view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = view;
    [flowLayout release];
    [view release];
    [self.collect release];
    
}



- (void)addTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
     }



#pragma mark - tableView 代理

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

#pragma mark - collView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    ModleTitle *model = [self.arrHeader objectAtIndex:indexPath.item];
    [cell passModel:model];
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
