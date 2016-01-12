//
//  SecondViewController.m
//  UI09_HOMEWORK
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"



@interface SecondViewController ()
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIButton *button;


@end

@implementation SecondViewController

- (void)dealloc {
    [_textField release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createText];
    self.view.backgroundColor = [UIColor blackColor];
    
}



- (void)createText {

    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 50)];
    self.textField.text = self.str;
    self.textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [_textField release];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 150, self.view.frame.size.width - 100, 50);
    [self.button setTitle:@"上一页" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(perAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    

}

- (void)perAction:(UIButton *) button {
   
    [self.navigationController popToViewController:[self.navigationController.viewControllers firstObject] animated:YES];
    [self.delegate changeValue:self.textField];
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
