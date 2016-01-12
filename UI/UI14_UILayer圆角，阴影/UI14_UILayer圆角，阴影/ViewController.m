//
//  ViewController.m
//  UI14_UILayer圆角，阴影
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //圆角
    self.button.layer.cornerRadius = self.button.frame.size.width/2;
  self.button.layer.masksToBounds =YES;
    
    //边
    self.button.layer.borderWidth = 2.0f;
    self.button.layer.borderColor = [UIColor redColor].CGColor;
    
    //阴影
    
    self.button.layer.shadowOffset = CGSizeMake(10, 10);
    self.button.layer.shadowColor = [UIColor grayColor].CGColor;
    self.button.layer.shadowOpacity = 1;
    self.button.layer.shadowRadius = 1;
    
    
    // 圆角
    self.imageView.layer.cornerRadius = 20;
    self.imageView.layer.masksToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
