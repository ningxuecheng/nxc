//
//  ViewController.m
//  UI16_TabBar
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) UIButton *button;
@end

@implementation ViewController

- (void)dealloc {
    [_button release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButton];
}

- (void)createButton {

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(80, 100, self.view.frame.size.width - 80, 40);
    
    [self.button setTitle:@"click" forState:0];
    [self.button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    [_button release];


}

- (void)backAction:(UIButton *)button {

//跳转下一页
    self.tabBarController.selectedIndex = 1;

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
