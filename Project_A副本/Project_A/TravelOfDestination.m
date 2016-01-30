//
//  TravelOfDestination.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TravelOfDestination.h"
#import "ModelOfDestin.h"
#import "CellOfDestin.h"
#import "DestinOfInfoViewController.h"
#import <AFNetworking/AFURLSessionManager.h>
@interface TravelOfDestination ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) UITableView *tableView;
@end

@implementation TravelOfDestination
- (void)dealloc {
    [_tableView release];
    [_array release];
    [_strURL release];
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
                ModelOfDestin *model = [[ModelOfDestin alloc] init];
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
    [self.tableView registerClass:[CellOfDestin class]forCellReuseIdentifier:@"CellOfDestin"];
    
    [_tableView release];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfDestin *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfDestin"];
    
    ModelOfDestin *model = [self.array objectAtIndex:indexPath.row];

    [cell passAnyModel:model];
    return cell;
    
};
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ddd");


    
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
