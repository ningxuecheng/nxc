//
//  ViewController.m
//  UI15_Xib_可视化编程和约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "ModelForList.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
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
    [self handleData];
    [self tableViewSubViews];
    
}

- (void)tableViewSubViews {
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool1"];
    
    
    [_tableView release];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    [cell passModel:self.array[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}

- (void)handleData {
    self.array = [NSMutableArray array];
    //json 文件解析
    NSString *path = [[NSBundle mainBundle] pathForResource:@"activitylist" ofType:@"txt"];
    //转换为二进制数据对象
    NSData *data = [NSData dataWithContentsOfFile:path];
   
    //
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    //数据处理
    NSArray *arr = [result objectForKey:@"events"];
    
    for (NSDictionary *dic in arr) {
        ModelForList *model = [[ModelForList alloc] init];
        
        [model setValuesForKeysWithDictionary:dic];
        
        [self.array addObject:model];
        [model release];
        
        
    }
    
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
