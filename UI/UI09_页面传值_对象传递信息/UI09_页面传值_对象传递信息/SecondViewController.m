//
//  SecondViewController.m
//  UI09_页面传值_对象传递信息
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, retain) UILabel *label;
@end

@implementation SecondViewController


- (void)dealloc {
    [_label release];
    [super dealloc];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLael];
}

- (void)createLael {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 40)];
    self.label.backgroundColor = [UIColor lightGrayColor];
    self.label.text = self.receiveStr;
    [self.view addSubview:self.label];
    [_label release];

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
