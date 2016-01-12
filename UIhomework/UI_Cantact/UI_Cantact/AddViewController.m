//
//  AddViewController.m
//  UI_Cantact
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (nonatomic, retain) UITextField *text_Name;
@property (nonatomic, retain) UITextField *text_Phone;
@property (nonatomic, retain) UIButton *button;

@end
@implementation AddViewController
- (void)dealloc {
    [_text_Name release];
    [_text_Phone release];
    [_button release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    
}


- (void)creatView {
   
    self.text_Name = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    self.text_Name.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.text_Name];
    [self.text_Name release];

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
