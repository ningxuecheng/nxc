//
//  ViewController.m
//  UI_ScrollView_InSet属性
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) UIScrollView *scroll;
@end

@implementation ViewController

- (void)dealloc {
    [_scroll release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //当前inset关掉
    self.automaticallyAdjustsScrollViewInsets = NO;
    //全部关掉
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    [self createScroll];
}

- (void)createScroll {
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    scroll.center = self.view.center;
    [self.view addSubview:scroll];
    scroll.backgroundColor = [UIColor lightGrayColor];
    
    scroll.contentSize = CGSizeMake(600, 1000);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    imageView.frame = CGRectMake(0, 0, 300, 500);
    [scroll addSubview:imageView];
    
    
    //inset属性
    scroll.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
