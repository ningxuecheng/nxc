//
//  secondViewController.m
//  UI08_homework
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self changeNavigationItem];
    
}
- (void)viewWillAppear:(BOOL)animated {

}

- (void)changeNavigationItem {
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"1页",@"2页"]];
    
    self.navigationItem.titleView = seg;
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(deAction:)];
    [seg release];



}

- (void)deAction:(UIBarButtonItem *)btn {
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
