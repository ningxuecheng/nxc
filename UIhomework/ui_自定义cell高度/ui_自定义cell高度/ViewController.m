//
//  ViewController.m
//  ui_自定义cell高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellOfNews.h"
#import "Model.h"
#import "Second.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;

@end


@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self createTableView];
}

#pragma mark - 创建tableView
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView release];
    
    [self.tableView registerClass:[CellOfNews class] forCellReuseIdentifier:@"pool1"];

}


#pragma mark - Data

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    Model *mod = [self.array objectAtIndex:indexPath.row];
   
    return [CellOfNews heightOfLines:mod];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    Model *mod = [self.array objectAtIndex:indexPath.row];
    [cell passModel:mod];

    return cell;
}


#pragma mark -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    Second *sc = [[Second alloc] init];
    
    [self.navigationController pushViewController:sc animated:YES];
    NSLog(@"dsa");


}

#pragma mark - handleData

- (void)handleData {
    self.array = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"News" ofType:@"txt"];
  
    NSData *data = [NSData dataWithContentsOfFile:path];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *arr = [result objectForKey:@"news"];
    NSLog(@"%@",arr);
    
    for (NSDictionary *dic in arr) {
        Model *new = [[Model alloc] init];
        [new setValuesForKeysWithDictionary:dic];
        [self.array addObject:new];
        [new release];
        
    }
    
    //NSLog(@"%@",self.array);

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
