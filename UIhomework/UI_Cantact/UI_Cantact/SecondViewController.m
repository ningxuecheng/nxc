//
//  SecondViewController.m
//  UI_Cantact
//
//  Created by dllo on 15/12/26.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, retain) UILabel *label_name;
@property (nonatomic, retain) UILabel *label_phone;
@property (nonatomic, retain) UILabel *label_hobby;
@property (nonatomic, retain) UIImageView *imageView;
@end

@implementation SecondViewController
- (void)dealloc {
    [_dic release];
    [_label_hobby release];
    [_label_name release];
    [_label_phone release];
    [_imageView release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
}


- (void)createView {

    self.label_name = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, self.view.frame.size.width - 200, 40)];
    self.label_name.text = [self.dic objectForKey:@"name"];
    
    self.label_phone = [[UILabel alloc] initWithFrame:CGRectMake(100, 350, self.view.frame.size.width - 200, 40)];
    self.label_phone.text = [self.dic objectForKey:@"phone"];
    
    self.label_hobby = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, self.view.frame.size.width - 200, 40)];
    self.label_hobby.text = [self.dic objectForKey:@"hobby"];
    
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.dic objectForKey:@"photo"]]];
    self.imageView.frame = CGRectMake(100, 80, self.view.frame.size.width - 200, 200);
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.label_hobby];
    [self.view addSubview:self.label_phone];
    [self.view addSubview:self.label_name];

    [_imageView release];
    [_label_phone release];
    [_label_hobby release];
    [_label_name release];




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
