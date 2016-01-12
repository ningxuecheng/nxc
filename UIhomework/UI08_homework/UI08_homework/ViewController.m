//
//  ViewController.m
//  UI08_homework
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "CellView.h"
@interface ViewController ()
@property (nonatomic, retain) UIButton *btn;
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation ViewController

- (void)dealloc {
    [_btn release];
    [_scroll release];
    [super dealloc];

}
- (void)viewWillAppear:(BOOL)animated {
    [self changeBar];
    [self changeNavigationItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self createCell];
    
    
}

- (void)createCell {
    NSArray *arrImg = [NSArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.png", nil];
    NSArray *arrName = [NSArray arrayWithObjects:@"妮可",@"初音",@"亚丝娜", @"时崎狂三",@"初音未来",@"金刚",@"亚丝娜",@"南小鸟",nil];
    NSArray *arrTel = [NSArray arrayWithObjects:@"123",@"42342",@"12313",@"12313",@"12313",@"12313",@"12313",@"12313", nil];
    
    CellView *cell = [[CellView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) images:arrImg namearr:arrName telarr:arrTel];
    [self.view addSubview:cell];


}





- (void)changeBar {
    /** 导航栏显示隐藏设置*/
    self.navigationController.navigationBarHidden = NO;
    /** 导航栏样式 */
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    

}
- (void)changeNavigationItem {
self.navigationItem.title = @"第一页";
    /** 左边部分 */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
}

- (void)addAction:(UIBarButtonItem *)item {
    secondViewController *second = [[secondViewController alloc] init];
    second.view.backgroundColor = [UIColor grayColor];
    
    [self.navigationController pushViewController:second animated:YES];
    [second release];

}

- (void)searchAction:(UIBarButtonItem *)item {
    thirdViewController *third = [[thirdViewController alloc] init];
    third.view.backgroundColor = [UIColor blueColor];
    
    [self.navigationController pushViewController:third animated:YES];
    [third release];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
