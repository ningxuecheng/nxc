//
//  ViewController.m
//  UI_Cantact
//
//  Created by dllo on 15/12/26.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "AddViewController.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableDictionary *arrDic;
@property (nonatomic, retain) NSMutableArray *arrKeys;
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_arrDic release];
    [_arrKeys release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createData];
    [self createTableView];
    [self tableViewisEdit];
}

#pragma mark - 创建tableView
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

}

#pragma mark - 区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.arrKeys.count;

}
#pragma mark - 区数名
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return [self.arrKeys objectAtIndex:section];
}
#pragma mark - 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *key = [self.arrKeys objectAtIndex:section];
    NSArray *arr = [self.arrDic objectForKey:key];
    
    return arr.count;
}

#pragma mark - 创建行（数据）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
static NSString *pool = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:pool] autorelease];
    }
    
    NSString *key = [self.arrKeys objectAtIndex:indexPath.section];
    NSArray *arr = [self.arrDic objectForKey:key];
    
    NSDictionary *dicper = [arr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dicper objectForKey:@"name"];
//    cell.imageView.image = [UIImage imageNamed:[dicper objectForKey:@"photo"]];
    cell.detailTextLabel.text = [dicper objectForKey:@"phone"];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    

    return cell;

}


#pragma mark - 创建数据
- (void)createData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    self.arrDic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",self.arrDic);
    
    self.arrKeys = [NSMutableArray arrayWithArray:[[self.arrDic allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    NSLog(@"%@",self.arrKeys);
    
}

#pragma mark - 代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
   NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
    NSString *key = [self.arrKeys objectAtIndex:indexPath.section];
    NSArray *arr = [self.arrDic objectForKey:key];
    
    NSDictionary *dicper = [arr objectAtIndex:indexPath.row];
    SecondViewController *second = [[SecondViewController alloc] init];
    
    second.dic = [NSMutableDictionary dictionaryWithDictionary:dicper];
   
    [self.navigationController pushViewController:second animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 让tableView进入编辑状态
- (void)tableViewisEdit {
/** 利用vc封装的一个方法，在导航栏上添加一个barbutton 当代年纪不同同时
    进入编辑状态
 
*/

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)] autorelease];

}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];

}

#pragma mark - 确定每一行的编辑风格
/** 却冬梅一行的编辑风格*/

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    switch (indexPath.row) {
//       
//            
//        default:
//            return 1;
//            break;
//    }
//}

#pragma mark - 根据提交状态编辑
/** 根据提交状态 编辑 */

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSString *key = [self.arrKeys objectAtIndex:indexPath.section];
        NSMutableArray *arr = [self.arrDic objectForKey:key];
        /** 时间按出数据源*/
        [arr removeObjectAtIndex:indexPath.row];
        
        /**tableView删除cell*/
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        /** 删除区 */
        if (arr.count < 1) {
            [self.arrDic removeObjectForKey:key];
            [self.arrKeys removeObject:key];
            NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:indexPath.section];
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationLeft];
        }
        
                
        
    }else if(editingStyle ==  UITableViewCellEditingStyleInsert) {
    
       
    
    }



}

- (void)addAction:(UIBarButtonItem *) button{
    NSLog(@"dasd");
    AddViewController *add = [[AddViewController alloc] init];
    [self.navigationController pushViewController:add animated:YES];
    

}





@end
