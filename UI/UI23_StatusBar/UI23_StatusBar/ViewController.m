//
//  ViewController.m
//  UI23_StatusBar
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 知识点1 StatusBar风格
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.button.isSelected) {
      return UIStatusBarStyleDefault;
    }
    return  UIStatusBarStyleLightContent;
}

- (IBAction)handleAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self setNeedsStatusBarAppearanceUpdate];
}
- (IBAction)nextPage:(id)sender {
}


@end
