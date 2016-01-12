//
//  RootVCViewController.m
//  UI03_HOMEWORK2
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "RootVCViewController.h"

@interface RootVCViewController ()

@end

@implementation RootVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, self.view.frame.size.width - 50, 60)];
    
    labelTitle.text = @"XX2014新专辑发行";
    labelTitle.font = [UIFont systemFontOfSize:25];
    labelTitle.textAlignment = 1;
    
    [self.view addSubview:labelTitle];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    imgView.frame = CGRectMake(30, 110, 150, 280);
    
    UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(210, 115, 200, 40)];
    labelTime.text = @"10-19 18:00 -- 10-19 23:30";
    labelTime.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:labelTime];
    
    [self.view addSubview:imgView];
    
    UILabel *labelSinger = [[UILabel alloc] initWithFrame:CGRectMake(210, 150, 200, 40)];
    labelSinger.text = @"赵磊";
    labelSinger.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:labelSinger];
    
    UILabel *labelMusic = [[UILabel alloc] initWithFrame:CGRectMake(210, 195, 200, 40)];
    labelMusic.text = @"类型: 音乐";
    labelMusic.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:labelMusic];
    
    
    UILabel *labelInter = [[UILabel alloc] initWithFrame:CGRectMake(210, 240, 150, 40)];
    labelInter.text = @"北京 东城区 北京市啊实打实的啊实打实的啊实打实 阿斯顿三层";
    labelInter.font = [UIFont systemFontOfSize:12];
    labelInter.numberOfLines = 0;
    [self.view addSubview:labelInter];
    
    [labelInter release];
    [labelMusic release];
    [labelSinger release];
    [labelTime release];
    [imgView release];
    [labelTitle release];
    
    
    
    // Do any additional setup after loading the view.
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
