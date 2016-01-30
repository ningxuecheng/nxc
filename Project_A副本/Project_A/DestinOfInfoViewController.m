//
//  DestinOfInfoViewController.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "DestinOfInfoViewController.h"
#import "ModelOfDesInfo.h"
#import "CellOfDesInfo.h"
#import <AFNetworking/AFURLSessionManager.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface DestinOfInfoViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) NSMutableDictionary *dicInfo;
@property (nonatomic, assign) CGFloat imgHeight;


@end

@implementation DestinOfInfoViewController

- (void)dealloc {
    [_strURL release];
    [_tableView release];
    [_array release];
    [_dicInfo release];
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
            self.dicInfo = [NSMutableDictionary dictionary];
            self.array = [NSMutableArray array];
            NSInteger keyNum = 0; //和天数一样
            NSArray *arrayP = [responseObject objectForKey:@"plan_days"];
            for (NSDictionary *dic in arrayP) {
                NSArray *arrayNodes = [dic objectForKey:@"plan_nodes"];
                NSMutableArray *arrModel = [NSMutableArray array];
                keyNum = keyNum + 1;
                
              NSString *keyName = [[[arrayNodes objectAtIndex:0] objectForKey:@"destination"] objectForKey:@"name_zh_cn"];
                for (NSDictionary *dicModel in arrayNodes) {
                    ModelOfDesInfo *model = [[ModelOfDesInfo alloc] init];
                    [model setValuesForKeysWithDictionary:dicModel];
                    [arrModel addObject:model];
                    [model release];
                }
                
                [self.dicInfo setObject:arrModel forKey:[NSString stringWithFormat:@"DAY%02ld %@",keyNum,keyName]];
                
            }
            
            self.array = [[self.dicInfo allKeys] sortedArrayUsingSelector:@selector(compare:)].mutableCopy;
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
    [self.tableView registerClass:[CellOfDesInfo class]forCellReuseIdentifier:@"CellOfDesInfo"];
    
    [_tableView release];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [self.array objectAtIndex:section];
    NSArray *arr = [self.dicInfo objectForKey:key];
    return arr.count;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [self.array objectAtIndex:section];
    return key;

}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfDesInfo *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfDesInfo"];
    NSString *key = [self.array objectAtIndex:indexPath.section];
    NSArray *arr = [self.dicInfo objectForKey:key];
    ModelOfDesInfo *model = [arr objectAtIndex:indexPath.row];
    CGFloat  wid = [model.lng floatValue];
    CGFloat  hei = [model.lat floatValue];
    
    self.imgHeight = hei * (self.view.frame.size.width - 30) / wid;
    
    
    [cell passAnyModel:model];
    
    return cell;
    
};




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [self.array objectAtIndex:indexPath.section];
    NSArray *arr = [self.dicInfo objectForKey:key];
    ModelOfDesInfo *model = [arr objectAtIndex:indexPath.row];
    
    CellOfDesInfo *cell = [[CellOfDesInfo alloc] init];
    
    return [cell heightForCell:model] +(WIDTH - 30)*0.65+10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
