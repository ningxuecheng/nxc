//
//  SecondViewController.m
//  UI08_UINavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "thirdViewController.h"

@interface SecondViewController ()
@property (nonatomic, retain) UIButton *btn;
@end

@implementation SecondViewController


- (void)viewWillAppear:(BOOL)animated {


    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBtn];
    
}

- (void)createBtn {
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(0, 0, self.view.frame.size.width - 100, 40);
    self.btn.center = self.view.center;
    [self.btn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    self.btn.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.btn];



}

- (void)nextAction:(UIButton *)btn {
    /** 创建第二页vc 对象 */
    
    thirdViewController *third = [[thirdViewController alloc] init];
    third.view.backgroundColor = [UIColor yellowColor];
    third.title = @"第三页";
    /** 推出第二页面*/
    
    [self.navigationController pushViewController:third animated:YES];
    
    /* 内存故那里*/
    [third release];
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeSystem];
    btnOne.frame = CGRectMake(50, 50, self.view.frame.size.width - 100, 50);
    [btnOne setTitle:@"上一页" forState:UIControlStateNormal];
    
    [btnOne addTarget:self action:@selector(oneBtn:) forControlEvents:UIControlEventTouchUpInside];
    [third.view addSubview:btnOne];
   

}

- (void)oneBtn:(UIButton *)btn {
    
    /** 返回首页 */
    
    /** 方法一 */
   // [self.navigationController popToRootViewControllerAnimated:YES];
    
    /** 方法二 从ViewControllers数组中取出返回的vc*/
    
    UIViewController *first = [self.navigationController.viewControllers firstObject];
    [self.navigationController popToViewController:first animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
