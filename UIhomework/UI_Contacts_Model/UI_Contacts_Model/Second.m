//
//  Second.m
//  UI_Contacts_Model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Second.h"

@interface Second ()
@property (nonatomic, retain) UITextField *text_name;
@property (nonatomic, retain) UITextField *text_phone;
@property (nonatomic, retain) UITextField *text_hobby;
@property (nonatomic, retain) UITextField *text_photo;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) NSDictionary *secDic;

@end

@implementation Second

- (void)dealloc {
    [_text_hobby release];
    [_text_phone release];
    [_text_photo release];
    [_text_name release];
    [_button release];
    [_secDic release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
}

- (void)createView {
    CGFloat width = self.view.frame.size.width;
    CGFloat height = 40;
    self.text_name = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, width - 100, height)];
    self.text_name.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.text_name];
    [_text_name release];
    
    self.text_phone = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, width - 100, height)];
    self.text_phone.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.text_phone];
    [_text_phone release];
    
    self.text_hobby = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, width - 100, height)];
    self.text_hobby.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.text_hobby];
    [_text_hobby release];
    
    self.text_photo = [[UITextField alloc] initWithFrame:CGRectMake(50, 250 ,width - 100, height)];
    self.text_photo.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.text_photo];
    [_text_photo release];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 300, width - 100, height);
    self.button.backgroundColor = [UIColor yellowColor];
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(confrimAction:) forControlEvents:UIControlEventTouchUpInside ];
    
    [self.view addSubview:self.button];
    [_button release];

    
    

}

- (void)confrimAction:(UIButton *)button {
    self.secDic = @{@"name":self.text_name.text,
                    @"phone":self.text_phone.text,
                    @"hobby":self.text_hobby.text,
                    @"photo":self.text_photo.text};

//    NSLog(@"%@",self.secDic);
    [self.delegate passVal:self.secDic];
    [self.navigationController popToViewController:[self.navigationController.viewControllers firstObject] animated:YES];

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
