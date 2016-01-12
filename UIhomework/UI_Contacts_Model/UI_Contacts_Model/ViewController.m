//
//  ViewController.m
//  UI_Contacts_Model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Contacts.h"
#import "CellOfContact.h"
#import "Second.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,SecondDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrKey;
@property (nonatomic, retain) NSMutableDictionary *dic;
@end
@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_arrKey release];
    [_dic release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self handleData];
    [self createTableView];
    [self tableViewIsEdit];
    
    
    
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView release];
    [self.tableView registerClass:[CellOfContact class] forCellReuseIdentifier:@"pool"];
    

}
#pragma mark - datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.arrKey.count;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    NSString *key = [self.arrKey objectAtIndex:section];
    NSArray *arr = [self.dic objectForKey:key];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *str = [self.arrKey objectAtIndex:section];
   
    return str;
}

#pragma mark - delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellOfContact *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    NSArray *arr = [self.dic objectForKey:key ];
    Contacts *con = arr[indexPath.row];
    [cell passModel:con];
    
     cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;

}




#pragma mark - data


- (void)handleData {
    
    /** 声明一个路径*/
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    /** 根据路径创建字典*/
    NSDictionary *dicTemp = [NSDictionary dictionaryWithContentsOfFile:path];
    /** 初始化字典（属性）*/
    self.dic = [NSMutableDictionary dictionary];
    
   
    
    
    for (NSString *key in dicTemp) {
        /** 初始化数组*/
        NSMutableArray *mArr = [NSMutableArray array];
          /** 取出数组 例：A[]数组*/
         NSMutableArray *array = [dicTemp objectForKey:key];
        /** 便利数组取出字典*/
        for (NSDictionary *dicCon in array) {
            Contacts *con = [[Contacts alloc] init];
            [con setValuesForKeysWithDictionary:dicCon];
            /** 吧model 填入字典*/
            [mArr addObject:con];
            [con release];
        }
        /** 把数组和对应key填入字典 */
        [self.dic setObject:mArr forKey:key];
    }
    self.arrKey = [[self.dic allKeys] sortedArrayUsingSelector:@selector(compare:)].mutableCopy;
}

#pragma mark - 让tableView进入编辑状态

- (void)tableViewIsEdit {

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
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
        NSMutableArray *arr = [self.dic objectForKey:key];
        
        /* 删除数据源*/
        [arr removeObjectAtIndex:indexPath.row];
        /** 删除对应cell */
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        
        /* 删除区 */
        if (arr.count == 0) {
            [self.dic removeObjectForKey:key];
            [self.arrKey removeObject:key];
            
            NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:indexPath.section];
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationLeft];
            [indexSet release];
        }
        
    }



}

- (void)addAction:(UIBarButtonItem *)button {
    Second *sec = [[Second alloc] init];
    sec.delegate = self;
    [self.navigationController pushViewController:sec animated:YES];

}


#pragma mark - 实现代理方法
- (void)passVal:(NSDictionary *)secDic {

    NSLog(@"%@",secDic);
    NSLog(@"代理人");
    NSString *key = [[secDic objectForKey:@"name"] substringToIndex:1].uppercaseString;
    
    Contacts *con = [[Contacts alloc] init];
    [con setValuesForKeysWithDictionary:secDic];
   
    
    
    if ([self.arrKey containsObject:key]) {
       
        NSMutableArray *arr = [self.dic objectForKey:key];
       [arr addObject:con];
       [self.tableView reloadData];
        
    }else {
        NSMutableArray *newArr = [NSMutableArray arrayWithObject:con];
        [self.dic setObject:newArr forKey:key];
        self.arrKey = [[self.dic allKeys] sortedArrayUsingSelector:@selector(compare:)].mutableCopy;
         [self.tableView reloadData];
    
    }
    
    
}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
