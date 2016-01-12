//
//  thirdViewController.m
//  UI08_homework
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "thirdViewController.h"

@interface thirdViewController ()

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeNavigationItem];
}

- (void)changeNavigationItem {
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(CameraAction:)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(freshAction:)];
    
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    [item2 release];
    [item1 release];
}

- (void)CameraAction:(UIBarButtonItem *)item {

    UIViewController *one = [self.navigationController.viewControllers firstObject];
    
    
    [self.navigationController popToViewController:one animated:YES];

}

- (void)freshAction:(UIBarButtonItem *)item {
    UIViewController *one = [self.navigationController.viewControllers firstObject];
    
    [self.navigationController popToViewController:one animated:YES];
    
    
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
