//
//  MapViewController.m
//  Project_A
//
//  Created by dllo on 16/1/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "MapViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface MapViewController ()<UIWebViewDelegate>
@property(nonatomic,retain)UIWebView *webView;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,WIDTH * 375,HEIGHT * 667)];
    [self.webView setDelegate:self];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ditu.amap.com/around"]];
    [self.view addSubview: self.webView];
    [self.webView loadRequest:request];
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
