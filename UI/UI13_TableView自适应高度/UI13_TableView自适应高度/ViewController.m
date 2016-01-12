//
//  ViewController.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ModelOfNews.h"
#import "CellOfNews.h"
#import "SecondViewController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrayModel;
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_arrayModel release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self tableViewSubView];
}



- (void)tableViewSubView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView release];
    
    /** 注册 */
    [self.tableView registerClass:[CellOfNews class] forCellReuseIdentifier:@"pool1"];
    


}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
   
    /** cell 赋值 */
    [cell passModel: [self.arrayModel objectAtIndex:indexPath.row]];
    
    
    return cell;

}


#pragma mark - tableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ModelOfNews *model = [self.arrayModel objectAtIndex:indexPath.row];
    
/** 通过cell的高度计算方法，返回高度值 */
   return  [CellOfNews  heightForCell:model];

}

#pragma mark - Data
- (void)handleData {
    
    self.arrayModel = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"News" ofType:@"txt"];
    //* 创建数据对象*/
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    /** 取出数组*/
    NSArray *arr = [result objectForKey:@"news"];
    
    /** 遍历数组将数组里的字典 转换为 model **/
    
    for (NSDictionary *dic in arr) {
        ModelOfNews *model = [[ModelOfNews alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arrayModel addObject:model];
        [model release];
    }
    
    


}


/**
 
 1 返回分区数
 2.返回每个区的行数
 3.重用池取cell
 4.初始化方法
 5.调用传值
 6.传入model赋值
 7.返回cell
 8.返回每行高度
 9计算高度方法
 **/

#pragma mark

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *sec = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:sec animated:YES];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
