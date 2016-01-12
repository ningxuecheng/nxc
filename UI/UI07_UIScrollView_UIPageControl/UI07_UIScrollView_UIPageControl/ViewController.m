//
//  ViewController.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Picture.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self createPicView];
}

#pragma mark - 知识点1 UIScrollView_UIPageControl

/** 详见Picture*/

- (void)createPicView {
    Picture *pic = [[Picture alloc] initWithFrame:CGRectMake(0, 0, 300, 400) images:@[@"1.jpg",@"2.png",@"3.jpg"]];
    
    [self.view addSubview:pic];
    
    [pic release];
    pic.center = self.view.center;


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
