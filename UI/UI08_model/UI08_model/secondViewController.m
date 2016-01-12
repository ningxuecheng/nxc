//
//  secondViewController.m
//  UI08_model
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "secondViewController.h"
#import "ViewController.h"

@interface secondViewController ()
@property (nonatomic, retain) UIButton *button;

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [self createButton];
}

- (void)createButton {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, 0, 200, 50);
    self.button.center = self.view.center;
    
    [self.button setTitle:@"return" forState:UIControlStateNormal];
    
    [self.view addSubview:self.button];
    
    self.button.backgroundColor = [UIColor yellowColor];
    [self.button addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

#pragma mark - 通过模态推出来的界面如何返回
- (void)returnAction:(UIButton *)button {
    
    ViewController *vc = [[ViewController alloc] init];
 [self presentViewController:vc animated:YES completion:^{
     
 }];
    
    
    
//   [self dismissViewControllerAnimated:YES completion:^{
//
//   }];


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
