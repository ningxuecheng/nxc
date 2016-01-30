//
//  TravelOfTrip.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TravelOfTrip.h"
#import "CellOfTrip.h"
#import "ModelOfTrip.h"
#import "DestinOfInfoViewController.h"
#import <AFNetworking/AFURLSessionManager.h>
@interface TravelOfTrip () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation TravelOfTrip

- (void)dealloc {
    [_strURL release];
    [_tableView release];
    [_array release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self createTableView];
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
                ModelOfTrip *model = [[ModelOfTrip alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                model.description_title = [dic objectForKey:@"description"];
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
    [self.tableView registerClass:[CellOfTrip class]forCellReuseIdentifier:@"CellOfTrip"];
    [_tableView release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfTrip *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfTrip"];
    ModelOfTrip *model = [self.array objectAtIndex:indexPath.row];
    [cell passModel:model];
    return cell;
    
};

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelOfTrip *model = [self.array objectAtIndex:indexPath.row];
    DestinOfInfoViewController *info = [[DestinOfInfoViewController alloc] init];
    info.strURL = [NSString stringWithFormat:@"http://chanyouji.com/api/plans/%@.json",model.id];
    [self.navigationController pushViewController:info animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 260;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
