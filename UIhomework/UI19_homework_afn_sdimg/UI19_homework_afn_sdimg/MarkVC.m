//
//  MarkVC.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "MarkVC.h"
#import "Model.h"
#import "CellOfNews.h"
@interface MarkVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation MarkVC

- (void)viewWillAppear:(BOOL)animated {

    [self handleData];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"收藏";
    [self handleData];
    [self createTableView];
    [self.tableView reloadData];
}

- (void)handleData {
  NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrData.plist"];
   NSMutableArray *array  = [NSMutableArray arrayWithContentsOfFile:file];
    self.arr = [NSMutableArray array];
    for (NSData *data in array) {
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        //开始反归档
        Model *model = [unarchiver decodeObjectForKey:@"model"];
        [unarchiver finishDecoding];
        [self.arr addObject:model];
        NSLog(@"%@",model.imgsrc);
    }
}
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CellOfNews" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool3"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"pool3"];
    [cell passModel:self.arr[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *mod = self.arr[indexPath.row];
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mod.url]];
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
