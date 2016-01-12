//
//  ViewController.m
//  UI_NextResponder
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ScrollForCustom.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButton];
}

- (void)createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"点击" forState:0];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 0, 300, 300);
    button.center = self.view.center;
    
#warning button 事件不一样
    [button addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    
    ScrollForCustom *scroll = [[ScrollForCustom alloc] initWithFrame:CGRectMake(50 , 80, 200, 200)];
    scroll.backgroundColor = [UIColor greenColor];
   
    [button addSubview:scroll];
    


}
- (void)Action:(UIButton *)btn{
    NSLog(@"ad");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
