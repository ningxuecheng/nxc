//
//  TravelCell.m
//  Project_A
//
//  Created by dllo on 16/1/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TravelCell.h"
#import <AFNetworking/AFURLSessionManager.h>
#import "ModelOfTravels.h"
#import "TravelOfCell.h"
@interface TravelCell () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation TravelCell
- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createTableView];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];

}
- (void)passURL:(NSString *)url {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.array = [NSMutableArray array];
            for (NSDictionary *dic in responseObject) {
                ModelOfTravels *model = [[ModelOfTravels alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.array addObject:model];
                [model release];
            }
            [self.tableView reloadData];
            
        }
        
        
    }];
    [dataTask resume];


}
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 0, [UIScreen mainScreen].bounds.size.width - 10, [UIScreen mainScreen].bounds.size.height - 160) style:UITableViewStylePlain];
    [self.contentView addSubview:self.tableView];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TravelOfCell class]forCellReuseIdentifier:@"TravelCell"];
    
    [_tableView release];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TravelOfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelCell"];
    ModelOfTravels *model = [self.array objectAtIndex:indexPath.row];
    [cell passModel:model];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 180;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //可能会出错
     ModelOfTravels *model = [self.array objectAtIndex:indexPath.row];
    [self.delegate travelCellDidSelectedItemPushVC:model.id];
    
}

@end
