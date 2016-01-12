//
//  ViewController.m
//  UI12_MVC之model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "CellOfContact.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableDictionary *dic;
@property (nonatomic ,retain) NSMutableArray *arrayKeys;
@end

@implementation ViewController
- (void)dealloc {
    [_tableView release];
    [_dic release];
    [_arrayKeys release];
    [super dealloc];



}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self createTableView];
}
- (void)handleData {
    
    
    /** 初始化*/
    self.dic = [NSMutableDictionary dictionary];
    
   
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    NSMutableDictionary *dicTemp =[NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    /** 便利字典，将数据转换成model 对象*/
    for (NSString *key in dicTemp) {
        /** 创建数组 用来存放key*/
        NSMutableArray *mArr =[NSMutableArray array];
        NSArray *arr = [dicTemp objectForKey:key];
        
        /** 便利数组*/
        for (NSDictionary *dicCon in arr) {
            Contact *cont = [[Contact alloc] init];
            //kvc方法  注意，对未识别的key的处理
            [cont setValuesForKeysWithDictionary:dicCon];
            [mArr addObject:cont];
            [cont release];
        }
        [self.dic setObject:mArr forKey:key];
    }
    self.arrayKeys = [NSMutableArray arrayWithArray:[self.dic allKeys]];
    [self.arrayKeys sortUsingSelector:@selector(compare:)];
    
    NSLog(@"%@",self.dic);
    
    //NSLog(@"%@",dicTemp);
    
}
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView release];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];
    [self.tableView registerClass:[CellOfContact class] forCellReuseIdentifier:@"pool2"];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     NSLog(@"%@",self.arrayKeys);
    NSLog(@"%ld",self.arrayKeys.count);
    return self.arrayKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    NSString *key = [self.arrayKeys objectAtIndex:section];
    [self.dic objectForKey:key];
    return [[self.dic objectForKey:key] count];
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *KEY = [self.arrayKeys objectAtIndex:section];

    return KEY;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    /** 返回cell的第二种写法（推荐）
        1. tableView 注册一个cell类，绑定一个重用池
        2. 从重用池中直接取cell，如果cell为空，系统会自动根据和重用池绑定的cell类创建cell对象
     */
    
    /** 注册*/
  
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
        
        /** cell赋值 **/
        NSString *key = [self.arrayKeys objectAtIndex:indexPath.section];
        
        NSArray *arr = [self.dic objectForKey:key];
        
        Contact *con = [arr objectAtIndex:indexPath.row];
        
        cell.imageView.image = [UIImage imageNamed:con.photo];
        cell.textLabel.text = con.name;
        
        return cell;
    }else {
    
        CellOfContact *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
        
        
        NSString *key = [self.arrayKeys objectAtIndex:indexPath.section];
        
        NSArray *arr = [self.dic objectForKey:key];
        
        Contact *con = [arr objectAtIndex:indexPath.row];
        
        /**cell赋值 */
        /*cell.imageL.image = [UIImage imageNamed:con.photo];
        cell.lableName.text = con.name;*/
        
        /** 思路：将model数据传入自定义cell中，在cell类里面
                 完成cell上子空间的复制过程
        **/
        
         /** MRC下可以重写setter方法，但不适用于ARC */
        
        //cell.con = con;
        
        
        
       
        [cell passModel:con];
        
        return cell;
    
    
    }
    


}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {


    return 60;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
