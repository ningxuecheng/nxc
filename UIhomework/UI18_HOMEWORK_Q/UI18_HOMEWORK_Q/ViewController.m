//
//  ViewController.m
//  UI18_HOMEWORK_Q
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "NetClass.h"
#import "Model.h"
#import "CellForM.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,NetClassDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) id str;
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
    [self handleArr];

    [self createTable];
}


- (void)createTable {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"CellForM" bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool"];
    NSLog(@"%s",__FUNCTION__);

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s",__FUNCTION__);

  return  self.array.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellForM *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    cell.label_name.text = self.array[indexPath.row];
    NSLog(@"%s",__FUNCTION__);

    return cell;
}

- (void)handleArr {
    NetClass *net = [[NetClass alloc] init];
    net.delegate = self;
    [net passNet:@"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"];
    
    
}
- (void)returnArr:(id)result {
    //NSLog(@"%@",result);
    NSArray *array = [NSArray array];
    self.array = [NSMutableArray array];
    
    array = [result objectForKey:@"newsList"];
    //    NSLog(@"%@",array);
    for (NSDictionary *dic in array) {
        Model *mod = [[Model alloc] init];
        
        [mod setValuesForKeysWithDictionary:dic];
        [self.array addObject:mod];
    }
    
    //    for (Model *mod in self.array) {
    //
    //        NSLog(@"%@",mod.title);
    //    }
    
    
    NSLog(@"%s",__FUNCTION__);

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
