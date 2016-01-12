//
//  ViewController.m
//  UI15Xib_homework
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellDefind.h"
#import "ModelFilm.h"
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
    [self handleData];
    [self tableViewSubviews];
    
    
}

- (void)tableViewSubviews {

    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];

    [self.view addSubview:self.tableView];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    UINib *nib = [UINib nibWithNibName:@"CellDefind" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool1"];
    
    [_tableView release];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellDefind *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];

    [cell passModel:self.array[indexPath.row]];
    return cell;
}

- (void)handleData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"activitylist" ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
  
    
    self.array = [NSMutableArray array];
    NSArray *arr = [result objectForKey:@"events"];
    
    for (NSDictionary *dic in arr) {
        ModelFilm *film = [[ModelFilm alloc] init];
        
        [film setValuesForKeysWithDictionary:dic];
        [self.array addObject:film];
        
    }
    
    NSLog(@"%@",self.array);
  


}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
