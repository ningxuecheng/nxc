//
//  ViewController.m
//  UI08_model
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
@interface ViewController ()
@property (nonatomic, retain) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"登陆";
    [self createButton];
}

- (void)createButton {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, 0, 200, 50);
    self.button.center = self.view.center;
    
    [self.button setTitle:@"next" forState:UIControlStateNormal];
    
    [self.view addSubview:self.button];
    
    self.button.backgroundColor = [UIColor yellowColor];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];



}

#pragma mark - 知识点1 模态推出ViewController

- (void)buttonAction:(UIButton *)button {
    
    /** 创建新的界面对象 */
    secondViewController *second = [[secondViewController alloc] init];
    
    /** 模态推出新界面. 模态是ViewController方法 */
    
    /** 模态推出效果*/
    
    second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:second animated:YES completion:^{
        
    }];
    
    /** 内存管理 */
    
    [second release];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
