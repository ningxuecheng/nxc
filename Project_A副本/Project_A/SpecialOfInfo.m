//
//  SpecialOfInfo.m
//  Project_A
//
//  Created by dllo on 16/1/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "SpecialOfInfo.h"
#import <AFNetworking/AFURLSessionManager.h>
#import "ModelOfSpecial.h"
#import "ModelOfSpInfo.h"
#import "CellOfSpInfo.h"
#import "CellOfSpImg.h"
@interface SpecialOfInfo () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) NSMutableDictionary *artDic;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, assign) CGFloat xHeight;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@end

@implementation SpecialOfInfo
- (void)dealloc {
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
            NSArray *artucle = [responseObject objectForKey:@"article_sections"];
           
            self.array = [NSMutableArray array];
            for (NSDictionary *dic in artucle) {
                ModelOfSpInfo *model = [[ModelOfSpInfo alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                model.description_s = [dic objectForKey:@"description"];
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
    [self.tableView registerClass:[CellOfSpInfo class]forCellReuseIdentifier:@"CellOfSpInfo"];
    [self.tableView registerClass:[CellOfSpImg class] forCellReuseIdentifier:@"CellOfSpImg"];
    
    
    
    [_tableView release];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ModelOfSpInfo *model = [self.array objectAtIndex:indexPath.row];
    if ([model.image_url isEqualToString:@""]) {
        CellOfSpInfo *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfSpInfo"];
        [cell passAnyModel:model];
        return cell;
        
    } else {
        CellOfSpImg *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfSpImg"];
        self.width = model.image_width.floatValue;
        self.height = model.image_height.floatValue;
//        CGFloat ww = self.width.floatValue;
//        CGFloat hh = self.height.floatValue;
//        CGFloat xOfimg = hh * (WIDTH - 30) / ww;
//        self.xHeight = xOfimg;
        self.xHeight = self.height * (self.view.frame.size.width - 30)/self.width;
        
        
        [cell passAnyModel:model];
    
        return cell;
    }
};

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     ModelOfSpInfo *model = [self.array objectAtIndex:indexPath.row];
    if ([model.image_url isEqualToString:@""]) {
        CellOfSpInfo *cell = [[CellOfSpInfo alloc] init];
        return [cell heightForCell:model];
    } else {
        CellOfSpImg *cell = [[CellOfSpImg alloc] init];
    
        return [cell heightForCell:model] + self.xHeight ;
    
    }
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
