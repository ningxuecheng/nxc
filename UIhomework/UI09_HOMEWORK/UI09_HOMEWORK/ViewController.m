//
//  ViewController.m
//  UI09_HOMEWORK
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController () <SecondViewControllerDelegate>
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIButton *button;

@end

@implementation ViewController

- (void)changeValue:(UITextField *)text {

    self.label.text = text.text;


}

- (void)dealloc {
    [_label release];
    [_button release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLabel];
    
    
    
}

- (void)createLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 40)];
    self.label.backgroundColor = [UIColor lightGrayColor];
    self.label.text = @"sda";
    [self.view addSubview:self.label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 150, self.view.frame.size.width - 100, 40);
    self.button.backgroundColor = [UIColor whiteColor];
    [self.button setTitle:@"下一页" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(nextButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    [_label release];
}

- (void)nextButton:(UIButton *)button {

    SecondViewController *sec = [[SecondViewController alloc] init];
    sec.str = self.label.text;
    sec.delegate = self;
    [self.navigationController pushViewController:sec animated:YES];

}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
