//
//  ViewController.m
//  UI08_UINavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (nonatomic, retain) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    /** 设置标题 */
    
    
    [self changeNavigationItem];
    [self createBtn];
    
    
}
/** 试图将要出现的时候调用此方法 */
- (void)viewWillAppear:(BOOL)animated {

[self changeBar];
}

#pragma mark - UINavigationBar

- (void)changeBar {
   /** 导航栏显示隐藏设置*/
    self.navigationController.navigationBarHidden = NO;

/** 导航栏样式 **/
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    /** 导航栏背景颜色*/
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    
    /** 导航栏上面item的颜色 */
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
}

- (void)changeNavigationItem {

    /** 中间的标题部分. */
    
    self.navigationItem.title = @"首页";
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"通话"]];
    
    self.navigationItem.titleView = seg;
    
    
    /** 左边部分 */

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    
    /** 右边部分*/
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(tuziAction:)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"dd" style:UIBarButtonItemStylePlain target:self action:@selector(ddAction:)];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    
}

- (void)tuziAction:(UIBarButtonItem *)item {


}
- (void)ddAction:(UIBarButtonItem *)item {
    
    
}


- (void)searchAction:(UIBarButtonItem *)barbutton {
    NSLog(@"%s",__FUNCTION__);

}


- (void)createBtn {
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    [self.btn setTitle:@"Next" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    self.btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.btn];
}

- (void)nextAction:(UIButton*)btn {
    /** 创建第二页vc 对象 */
    
    SecondViewController *second = [[SecondViewController alloc] init];
    second.view.backgroundColor = [UIColor whiteColor];
    second.title = @"第二页";
    /** 推出第二页面*/

    [self.navigationController pushViewController:second animated:YES];
    
    /* 内存故那里*/
    [second release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
