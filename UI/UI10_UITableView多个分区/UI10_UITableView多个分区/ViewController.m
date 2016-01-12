//
//  ViewController.m
//  UI10_UITableView多个分区
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableDictionary *dicContact;
@property (nonatomic, retain) NSMutableArray *keys;

@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_dicContact release];
    [_keys release];
    [super dealloc];



}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
[self handleData];
    //[self handleDataFromPlist];
    [self createTableView];
}

#pragma mark -
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    [_tableView release];
    
    self.tableView.dataSource = self;
    
}

/** 分区数 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.keys.count;
}
/** 分区标题 */

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

   
    return  [self.keys objectAtIndex:section];

}


/** 每个分区的行数*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    /** 从keys 中取出 key*/
    NSString *key = [self.keys objectAtIndex:section];
    
    /** 根据 key 从字典中获取数组 */
    
    NSArray *arr = [self.dicContact objectForKey:key];
    
    return arr.count;
}

/** 每行cell赋值*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static  NSString *str = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
    }
    /** cell的赋值。 */
    
    NSString *key = [self.keys objectAtIndex:indexPath.section];
    
    NSArray *arr = [self.dicContact objectForKey:key];
    
    /**  每个联系人的小字典 */
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"name"];
    cell.detailTextLabel.text = [dic objectForKey:@"tel"];
    
    
    
    
    
    return cell;
    
}

/** 右侧索引部分 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.keys;

}




#pragma mark - 数据
- (void)handleData {

    self.dicContact = @{@"Z":@[@{
                                   @"name":@"Zhangsan",
                                   @"tel":@"123456789"}
                               ,@{@"name":@"Zhangsi",
                                  @"tel":@"78945613"},
                                @{
                                   @"name":@"Zhangwu",
                                   @"tel":@"456132789",}],
                        @"L":@[@{@"name":@"LILI",
                                 @"tel":@"13846565656"},],
                        @"Y":@[@{@"name":@"yu",
                                 @"tel":@"1383838438",}
                               ,@{@"name":@"yuming",
                                  @"tel":@"1565656566"}],}.mutableCopy;
    /**将字典中的key 取出来并且排序 */
    
    
    self.keys = [NSMutableArray arrayWithArray:[[self.dicContact allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    
    
}


- (void)handleDataFromPlist {
/** 创建plist文件 **/
    
    /** 将plist转换为字典 */
    
    /** 找出plist的路径*/
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    
    /** 生成字典 */
    self.dicContact = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",self.dicContact);
        
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
