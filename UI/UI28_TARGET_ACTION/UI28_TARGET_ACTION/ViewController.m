//
//  ViewController.m
//  UI28_TARGET_ACTION
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Touch.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
    
    
}

#pragma mark - 自定义View
- (void)createView {
    Touch *view = [[Touch alloc] initWithFrame:CGRectMake(20, 50, 100, 50)];

    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    //target action 赋值
    [view addTarget:self action:@selector(handleClicked:)];
}

- (void)handleClicked:(Touch *)view {
    NSLog(@"ddd");


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
