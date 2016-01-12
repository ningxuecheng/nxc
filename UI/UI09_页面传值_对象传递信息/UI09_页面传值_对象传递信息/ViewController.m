//
//  ViewController.m
//  UI09_页面传值_对象传递信息
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@property (nonatomic, retain) UITextField *textFieldName;
@property (nonatomic, retain) UITextField *textFieldPwd;
@property (nonatomic, retain) UIButton *button;


@end

@implementation ViewController

- (void)dealloc {
    [_textFieldName release];
    [_textFieldPwd release];
    [_button release];
    [_button release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTwotextField];
    [self createButton];
}


- (void)createTwotextField {

    self.textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 40)];
    self.textFieldName.borderStyle = 3;
    self.textFieldName.placeholder = @"请输入用户名";
    [self.view addSubview:self.textFieldName];
    [_textFieldName release];
    
    self.textFieldPwd = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 40)];
    self.textFieldPwd.borderStyle = 3;
    self.textFieldPwd.placeholder = @"请输入用密码";
    [self.view addSubview:self.textFieldPwd];
    [_textFieldPwd release];
}

- (void)createButton {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 230, self.view.frame.size.width - 100, 40);
    [self.button setTitle:@"下一页" forState:UIControlStateNormal];
    
    [self.view addSubview:self.button];
    
    
    
    [self.button addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    self.button.backgroundColor = [UIColor yellowColor];
    
    [_button release];

}


- (void)nextAction:(UIButton *)btn {
    /** 创建第二页面对象, 注意此时已经在内存中完成开辟空间 */
    SecondViewController *sec = [[SecondViewController alloc] init];
    sec.receiveStr = [self.textFieldName.text stringByAppendingString:self.textFieldPwd.text];
    /** 找到第二界面对象并且对其中的一个属性赋值 注意此时内存中第二界面对象的属性完成了赋值 */
    sec.receiveStr = [NSString stringWithFormat:@"name:%@,pwd:%@",self.textFieldName.text,self.textFieldPwd.text];
    
    /** 将第二界面推入栈中 */
    [self.navigationController pushViewController:sec animated:YES];
    
    [sec release];
    
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
