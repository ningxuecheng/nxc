//
//  ViewController.m
//  UI10_TableView
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrData;//存放数据
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_arrData release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self createTableView];
    
    
    
}


- (void)handleData {
    
     /** 数组中都是字符串对象. */
//self.arrData = @[@"娜美",@"罗宾",@"香吉士",@"索隆",@"汉库克",@"布鲁克",@"佩罗娜",@"香阁斯",@"艾斯",@"小丑巴基",@"桔梗",@"莫利亚",@"乔巴",@"弗兰克"].mutableCopy;

    
    /** 数组中都是字典对象 */
    self.arrData = @[@{@"title":@"zhang",
                       @"detail":@"aaa",
                       @"image":@"1.jpg"},
                     @{@"title":@"zhang2",
                       @"detail":@"aaa",
                       @"image":@"2.jpg"},
                     @{@"title":@"zhang3",
                       @"detail":@"aaa",
                       @"image":@"3.jpg"},
                     @{@"title":@"zhang4",
                       @"detail":@"aaa",
                       @"image":@"4.jpg"},
                     @{@"title":@"zhang5",
                       @"detail":@"aaa",
                       @"image":@"5.png"},
                     
                     
                     ].mutableCopy;


}


- (void)createTableView {

    /** 创建对象 
        参数2 制定风格 */
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
   
    
   /** 重点 tableView 大部分功能通过Delegate设计模式实现的,及代理人通知
       tableView如何做...*/
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    /** tableView的一些API */
    
    /** 全局cell的高度(对所有cell起作用) */
    
    self.tableView.rowHeight = 80;
    
    /** 分割线样式 */
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    /** 分割线颜色 */
    self.tableView.separatorColor = [UIColor redColor];

}
#pragma mark - tableView DataSource

/** 必须实现的方法(1/2) */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return self.arrData.count;
}


#pragma mark - 知识点2 UITableViewCell重用池机制
/** 必须实现的协议方法(2/2) */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    UITableViewCell *tableCall = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"add"];
   
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
    
    
    /** static修饰的变量, 只初始化一次,
        在静态区开辟空间, 程序结束,内存才释放.
     */
    
   static NSString *pool1 = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool1];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:pool1] autorelease];
    }
    
    /** cell 进行赋值 
        系统封装好的cell只有三个控件可以赋值textLabel detailTextLabel imageView
        系统的cell有所谓的4种风格style,实际上就是上面三个控件的不同组合.
     */
    NSDictionary *dic = [self.arrData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"title"];
    
    cell.detailTextLabel.text = [dic objectForKey:@"detail"];
    
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"] ];
    
    
    /** CELL 最右边的辅助区域 */
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
   
    
    return cell;

}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    NSLog(@"%ld %ld",indexPath.section,indexPath.row);
    
    SecondViewController *second = [[SecondViewController alloc] init];
    second.dic = [NSMutableDictionary dictionary];
    second.dic = [self.arrData objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:second animated:YES];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
