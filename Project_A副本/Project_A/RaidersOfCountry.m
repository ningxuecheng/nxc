//
//  RaidersOfCountry.m
//  Project_A
//
//  Created by dllo on 16/1/25.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "RaidersOfCountry.h"
#import "CellOfRaiders.h"
#import "ModelOfRaiders.h"
#import "TravelOfguide.h"
#import "TravelOfSpecial.h"
#import "TravelOfTrip.h"
#import "TravelOfDestination.h"
#import <AFNetworking/AFURLSessionManager.h>
@interface RaidersOfCountry () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation RaidersOfCountry

- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];
}

- (void)viewDidAppear:(BOOL)animated {
    


}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self changeNavi];
    [self createTableView];
    
}
#pragma mark - navi
- (void)changeNavi {
  self.navigationItem.leftBarButtonItem.title = @"xx游记";
  UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-fenxiang-2"] style:UIBarButtonItemStylePlain target:self action:@selector(shareAction:)];
    
    self.navigationItem.rightBarButtonItem = item1;
    [item1 release];

}
- (void)shareAction:(UIBarButtonItem *)btn {
    NSLog(@"share");
}
#pragma mark - data
- (void)handleData {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:self.strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.array = [NSMutableArray array];
            for (NSDictionary *dic in responseObject) {
                ModelOfRaiders *model = [[ModelOfRaiders alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.array addObject:model];
              
                [model release];
            }
            [self.tableView reloadData];
        }
    }];
    [dataTask resume];





}
#pragma mark - tableView
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CellOfRaiders class]forCellReuseIdentifier:@"CellOfRaiders"];
    
    [_tableView release];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfRaiders *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfRaiders"];
    cell.block = ^(NSString *strid,NSString *str) {
        if ([str isEqualToString:@"攻略"]) {
            TravelOfguide *vc = [[TravelOfguide alloc] init];
            vc.strURL = [NSString stringWithFormat:@"http://chanyouji.com/api/wiki/destinations/%@.json",strid];
            [self.navigationController pushViewController:vc animated:YES];
            [vc release];
        } else if ([str isEqualToString:@"行程"]) {
            TravelOfTrip *vc = [[TravelOfTrip alloc] init];
            vc.strURL = [NSString stringWithFormat:@"http://chanyouji.com/api/destinations/plans/%@.json?page=1",strid];
            [self.navigationController pushViewController:vc animated:YES];
            [vc release];
        } else if ([str isEqualToString:@"旅行地"]) {
            TravelOfDestination *vc = [[TravelOfDestination alloc] init];
            vc.strURL = [NSString stringWithFormat:@"http://chanyouji.com/api/destinations/attractions/%@.json?page=1",strid];
            [self.navigationController pushViewController:vc animated:YES];
            [vc release];
        
        } else {
            TravelOfSpecial *vc = [[TravelOfSpecial alloc] init];
            vc.strURL = [NSString stringWithFormat:@"http://chanyouji.com/api/articles.json?destination_id=%@&page=1",strid];
            [self.navigationController pushViewController:vc animated:YES];
            [vc release];

        
        }
    };
    
    ModelOfRaiders *model = [self.array objectAtIndex:indexPath.row];
    [cell passModel:model];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 260;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    NSLog(@"%ld",indexPath.row);
//    
//}




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
