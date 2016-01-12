//
//  ViewController.m
//  UI16_homework_json_xml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellForM.h"
#import "ParserSAX.h"
#import "Cartoon.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self createTableView];
}

- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.tableView registerClass:[CellForM class] forCellReuseIdentifier:@"pool1"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CellForM" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool2"];
    
    [_tableView release];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //return self.arr.count;
    return self.arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Cartoon *mod = [self.arr objectAtIndex:indexPath.row];
    
   return [CellForM heightForRow:mod.desc];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellForM *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
   
    [cell passModel:self.arr[indexPath.row]];
    return cell;
}


- (void)handleData {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Cartoon" ofType:@"xml"];
    ParserSAX *parser = [[ParserSAX alloc] init];
    self.arr = [NSMutableArray arrayWithArray:[parser parserSAXWithFile:path]];
    for (Cartoon *stu in self.arr) {
        NSLog(@"%@,%@",stu.name,stu.desc);
    }
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_arr release];
    [_tableView release];
    [super dealloc];
}
@end
