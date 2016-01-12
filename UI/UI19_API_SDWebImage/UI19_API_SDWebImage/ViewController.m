//
//  ViewController.m
//  UI19_API_SDWebImage
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//
//-fobjc-arc
#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "NetworkHandler.h"
@interface ViewController ()<NetworkHandlerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self tableViewcreate];
    
}

- (void)handleData {

NSString *string = @"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1";


    [NetworkHandler HandlerJSONWithURL:string delegate:self];


}


- (void)handleDidComplete:(id)result {
    self.array = [NSMutableArray array];
    
    NSArray *arr = [result objectForKey:@"newsList"];
    for (NSDictionary *dic in arr) {
        NSString *imageURL = [dic objectForKey:@"image"];
        [self.array addObject:imageURL];
    }
    
    [self.tableView reloadData];

}

- (void)tableViewcreate {
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool"];
    
    [self.view addSubview:self.tableView];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    //cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    NSString *str = [self.array objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:str];
    
    
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1.jpg"] options:SDWebImageProgressiveDownload];
    
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
