//
//  ViewController.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFURLSessionManager.h"
#import "CellOfNews.h"
#import "Model.h"
#import "CellOfAdds.h"
#import "Second.h"
#import "CellOfHeed.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) NSMutableArray *arrHead;
@property (nonatomic, retain) id result;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self tableViewcreate];
    
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"网易" style:UIBarButtonItemStylePlain target:self action:@selector(ddAction:)];
    
    self.navigationItem.leftBarButtonItems = @[item2];
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
   
    NSLog(@"%@",NSHomeDirectory());
}

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
                Model *mod = [[Model alloc] init];
                [mod setValuesForKeysWithDictionary:dic];
                [self.array addObject:mod];
            }
            [self.array removeObjectAtIndex:0];
            [self.tableView reloadData];
            
        }
        
        
    }];
    [dataTask resume];



}

- (void)tableViewcreate {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CellOfNews" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool1"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CellOfAdds" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool2"];
    
    [self.tableView registerClass:[CellOfHeed class] forCellReuseIdentifier:@"head"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *mod = self.array[indexPath.row];
    if ([mod.digest isEqualToString:@""]) {
        CellOfAdds *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
        [cell passModle:mod];
        return cell;
    }else {
    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
         [cell passModel:mod];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *mod = self.array[indexPath.row];
    if ([mod.digest isEqualToString:@""]) {
         return 180;
    }
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     Model *mod = self.array[indexPath.row];
    Second *sec = [[Second alloc] init];
    sec.url = mod.url;
    sec.digest = mod.digest;
    sec.docid = mod.docid;
    sec.title = mod.title;
    sec.imgsrc = mod.imgsrc;
   [self.navigationController pushViewController:sec animated:YES];
   
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mod.url]];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
