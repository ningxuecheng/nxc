//
//  SecondViewController.m
//  UI10_TableView
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, retain) UILabel *label_name;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *label_content;


@end

@implementation SecondViewController
- (void)dealloc {
    [_dic release];
    [_label_content release];
    [_label_name release];
    [_imageView release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
}

- (void)createView {
//    [dic objectForKey:@"title"];
//    ext = [dic objectForKey:@"detail"];
//    [UIImage imageNamed:[dic objectForKey:@"image"]
    self.label_name = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width- 100) / 2 +60, 150, (self.view.frame.size.width - 100)/2, 30)];
    self.label_name.backgroundColor = [UIColor yellowColor];
    self.label_name.text = [self.dic objectForKey:@"title"];
    [self.view addSubview:self.label_name];
    [self.label_name release];
    
    self.label_content = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width- 100) / 2 +60, 200, (self.view.frame.size.width - 100)/2, 30)];
    self.label_content.backgroundColor = [UIColor yellowColor];
    self.label_content.text = [self.dic objectForKey:@"detail"];
    [self.view addSubview:self.label_content];
    [self.label_content release];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.dic objectForKey:@"image"]]];
    
    self.imageView.frame = CGRectMake(50, 100, (self.view.frame.size.width- 100) / 2, 200);
    self.imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.imageView];
    
    [_imageView release];
    


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
