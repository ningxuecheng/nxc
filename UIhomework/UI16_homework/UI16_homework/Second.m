//
//  Second.m
//  UI16_homework
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Second.h"
#import "Picture.h"
@interface Second ()

@end

@implementation Second

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"第二页";
    
    [self createPicView];
}


#pragma mark - 1.UIScrollView UIPageControl
//见picture类
- (void)createPicView {
    Picture *pic = [[Picture alloc] initWithFrame:CGRectMake(0, 0, 300, 400) images:@[@"1.jpg", @"2.jpg", @"3.jpg"]];
    pic.center = self.view.center;
    
    //让布局不受navigationController 的44影响

    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:pic];
    [pic release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
