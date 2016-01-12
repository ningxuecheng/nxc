//
//  ViewController.m
//  UI12_UITableView自定义cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "cellOfContact.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableDictionary *dic;
@property (nonatomic, retain) NSMutableArray *arrkeys;
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_dic release];
    [_arrkeys release];
    [super dealloc];


}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self createTableView];
    
}

- (void)createTableView {

   self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
 
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [_tableView release];
    


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrkeys.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    /** 创建系统的cell **/
    if (indexPath.row == 0) {
        
        static NSString *str = @"reuse";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str] autorelease];
        }
        
        /** cell的赋值*/
        cell.textLabel.text = @"系统cell";
        cell.accessoryType = UITableViewCellAccessoryDetailButton;;
        return cell;
    }else {
        
        /**  获取自定义cell
         详见cellOfContact
         */
        
        static NSString *pool = @"reuse2";
        cellOfContact *cell = [tableView dequeueReusableCellWithIdentifier:pool];
        if (cell == nil) {
            cell = [[[cellOfContact alloc] initWithStyle:0 reuseIdentifier:pool] autorelease];
        }
        
        
        return cell;
    }
    
    
    
}


#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {



    return 100;
}

- (void)handleData {
    self.arrkeys = @[@"zhangsan",@"lisi",@"wangwu"].mutableCopy;


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
