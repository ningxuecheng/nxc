//
//  Second.m
//  UI29_homework
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Second.h"

@interface Second ()
@property (retain, nonatomic) UITextField *textF;
@property (nonatomic, retain) UIButton *button;

@end

@implementation Second

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textF = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    self.textF.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.textF];

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 150, 100, 40);
    [self.button setTitle:@"ddd" forState:UIControlStateNormal];
    
    [self.button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    
}


- (void)handleAction:(UIButton *)button {
    [self.delegate passValue:self.textF.text];
    self.block(self.textF.text);
    
}
    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

   //获取第二界面的对象
  UIViewController *vc = [segue destinationViewController];


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
