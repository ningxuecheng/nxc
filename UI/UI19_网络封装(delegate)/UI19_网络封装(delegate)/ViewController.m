//
//  ViewController.m
//  UI19_网络封装(delegate)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "NetworkHandler.h"
@interface ViewController () <NetworkHandlerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self tableViewcreate];
    
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
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
 
    return cell;

}
- (void)handleData {

    //接口1
//    NetworkHandler *net = [[NetworkHandler alloc] init];
//     net.delegate = self;
//    [net networkHandlerJSONWithURL:@"http://api.map.baidu.com/place/v2/search?query=银行&region=大连&output=json&ak=6E823f587c95f0148c19993539b99295"];

    //接口2
    [NetworkHandler HandlerJSONWithURL:@"http://api.map.baidu.com/place/v2/search?query=银行&region=大连&output=json&ak=6E823f587c95f0148c19993539b99295" delegate:self];
    
   


}
- (void)handleDidComplete:(id)result {
    NSLog(@"%@",result);
    self.array = [NSMutableArray array];
    NSArray *arr = [result objectForKey:@"results"];
    
    for (NSDictionary *dic in arr) {
        NSString *name = [dic objectForKey:@"name"];
        [self.array addObject:name];
        
    }
    
    [self.tableView reloadData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
