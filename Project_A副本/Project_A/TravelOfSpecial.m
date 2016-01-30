//
//  TravelOfSpecial.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TravelOfSpecial.h"
#import "ModelOfSpecial.h"
#import "CellOfSpecial.h"
#import "SpecialOfInfo.h"
#import <AFNetworking/AFURLSessionManager.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface TravelOfSpecial () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation TravelOfSpecial
- (void)dealloc {
    [_strURL release];
    [_array release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
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
                ModelOfSpecial *model = [[ModelOfSpecial alloc] init];
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
    [self.tableView registerClass:[CellOfSpecial class]forCellReuseIdentifier:@"CellOfSpecial"];
    
    [_tableView release];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfSpecial *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfSpecial"];
    
    ModelOfSpecial *model = [self.array objectAtIndex:indexPath.row];
    
    [cell pass:model];
    
    
    return cell;

};

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelOfSpecial *model = [self.array objectAtIndex:indexPath.row];
    SpecialOfInfo *info = [[SpecialOfInfo alloc] init];
    info.strURL = [NSString stringWithFormat:@"http://chanyouji.com/api/articles/%@.json",model.id];
    info.any = model;
    [self.navigationController pushViewController:info animated:YES];
}







- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return  (WIDTH - 30)*0.7 + 20;
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
