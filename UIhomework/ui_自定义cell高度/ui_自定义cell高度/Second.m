//
//  Second.m
//  ui_自定义cell高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Second.h"
#import "CellSecond.h"
#import "TheridView.h"

@interface Second () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *array;

@end


@implementation Second

- (void)dealloc {
    [_tableView release];
    [_array release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self tableViewSubView];
    
}


- (void)tableViewSubView {

    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[CellSecond class] forCellReuseIdentifier:@"pool2"];
    
    [_tableView release];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
return [CellSecond heightOfLines:[self.array objectAtIndex:indexPath.row]];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CellSecond *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
    cell.img.image = [UIImage imageNamed:self.array[indexPath.row]];
    

    return cell;
}



- (void)handleData {


    self.array = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    TheridView *third = [[TheridView alloc] init];
    
    [self.navigationController pushViewController:third animated:YES];


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
