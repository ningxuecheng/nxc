//
//  ViewController.m
//  UI04_HOMEWORK
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "DesView.h"
#import "LabelWithBtn.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self touchEvent];
    [self labelBtn];
    
}

- (void)touchEvent {
    DesView *changeView = [[DesView alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width - 100, 50)];
    changeView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:changeView];
    [changeView release];

}
- (void)labelBtn {
    LabelWithBtn *labelBtn = [[LabelWithBtn alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    labelBtn.label.text = @"这只是一个按钮";
    labelBtn.backgroundColor = [UIColor orangeColor];
    labelBtn.delegate = labelBtn;
    [self.view addSubview:labelBtn];
    [labelBtn release];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
