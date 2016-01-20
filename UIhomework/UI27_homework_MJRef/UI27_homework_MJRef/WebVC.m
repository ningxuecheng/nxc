//
//  WebVC.m
//  UI27_homework_MJRef
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "WebVC.h"
#import "Model.h"
@interface WebVC ()<UIWebViewDelegate>
@property (nonatomic, retain) UIWebView *portWebView;
@property (nonatomic, retain) Model *model;
@end

@implementation WebVC

- (void)dealloc {
    [_portWebView release];
    [_model release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.portWebView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.portWebView];
    NSURL *url = [NSURL URLWithString:self.model.url];
    [self.portWebView loadRequest:[NSURLRequest requestWithURL:url]];
}


- (void)passModel:(Model *)model {

    self.model = model;



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
