//
//  ViewController.m
//  UI11_UITableView编辑（cell的删除插入移动）
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrData;
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_arrData release];
    [super dealloc];


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrData.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

static NSString *str = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    cell.textLabel.text = self.arrData[indexPath.row];
    
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%ld",indexPath.row);
    


}


#pragma mark ** cell编辑相关方法
/** 确定哪些行可以进入编辑状态 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     /** 如果想控制某些行进入编辑状态，使用indexPath参数，
         判断具体的行
      
         注意：返回YES,可以编辑，返回NO,不能编辑
              默认（此方法不用实现）都可以编辑
      */


    return YES;
}
#pragma mark - tableView Delegate
/** 确定每行的编辑风格（删除 添加）*/
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 需求：第一行添加，其他航删除*/
    switch (indexPath.row) {
        case 0:
            return 2; //插入风格
            break;
        case 1:
            return 1; //删除风格
        case 2:
            return 1|2; //选中状态
        default:
            return 1;
            break;
     }
    
   
}
/** 提交点击状态*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    /** 实现删除功能*/
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        /** 数据源删除数据*/
        [self.arrData removeObjectAtIndex:indexPath.row];
        
        /** tableView删除cell*/
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationLeft];
    }else if ( UITableViewCellEditingStyleInsert == editingStyle) {
         //判断是插入状态
         /** 更新数据源 */
        
        [self.arrData insertObject:@"张三" atIndex:indexPath.row];
        /** tableView插入cell*/
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }


}


#pragma mark ** cell 移动相关的方法
/* 确定哪些行可以移动*/
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    
}

/* 移动*/
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
   /** 注意此方法中 不写代码，cell就可以实现移动，
     * 因此，此方法中的代码主要是更新数据。
    */
    
    /** 找对象 */
    NSString *str = [[self.arrData objectAtIndex:fromIndexPath.row] retain];
    
    /** 对象先从数组中移除*/
    [self.arrData removeObjectAtIndex:fromIndexPath.row];
    
    /** 对象插入数组中 */
    [self.arrData insertObject:str atIndex:toIndexPath.row];
    
    [str release];
    
    for (int i = 0; i < self.arrData.count; i++) {
        NSLog(@"%@",self.arrData[i]);
    }

}


- (void)create {


    self.arrData = @[@"dad",@"dasd",@"weqe",@"34234",@"qwe123"].mutableCopy;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"tableView";
    [self create];
    [self createTableView];
    [self tableViewisEdit];
    
}


- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;



}
#pragma mark - 知识点1 让tableView进入编辑状态

- (void)tableViewisEdit {
    /** 利用vc的一个封装方法，在导航栏上添加一个BarButton 当点击此button时，调用
     下面的setEding：animated：方法*/
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
   /** 让tableView进入编辑状态 */
    /** 必须先调用父类方法*/
    [super setEditing:editing animated:animated];
    
    /* 进入或退出编辑状态 */
    [self.tableView setEditing:editing  animated:animated];
    
    

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
