//
//  ViewController.m
//  UIO6_homework2
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "LTView.h"
@interface ViewController ()
@property (nonatomic, retain)UIImageView *imgBack;
@property (nonatomic, retain)NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self createZhu];
    [self createMall];
   
    [self createLogin];
    [self createUISeg];
    
    
    
    
    
}


- (void)createLogin {
    UIImageView *backone = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    backone.tag = 100;
    
    backone.frame = self.view.frame;
    [self.view addSubview:backone];
    
    [backone release];
    
    LTView *ltName = [[LTView alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 40)];
    ltName.textOfRight.placeholder = @"请输入用户名";
    
    ltName.labelOfLeft.text = @"用户名:";
    
    
    LTView *ltPwd = [[LTView alloc] initWithFrame:CGRectMake(50, 260, self.view.frame.size.width - 100, 40)];
    ltPwd.textOfRight.placeholder = @"请输入密码";
    ltPwd.labelOfLeft.text = @"密码:";
    
    /** 打开imageView用户交互 **/
    backone.userInteractionEnabled = YES;
    // 便利构造器 法创建对象
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.frame =CGRectMake(self.view.frame.size.width - 80, 330, 40, 30);
    // 设置button的标题
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    // 添加点击事件
    [loginButton addTarget:self action:@selector(login:)
          forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *pwdZhao = [UIButton buttonWithType:UIButtonTypeSystem];
    pwdZhao.frame = CGRectMake(200, 330, 100, 30);
    [pwdZhao setTitle:@"找回密码" forState:UIControlStateNormal];
    [pwdZhao addTarget:self action:@selector(zhaoAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [backone addSubview:pwdZhao];
    [backone addSubview:loginButton];
    [backone addSubview:ltPwd];
    [backone addSubview:ltName];
    [ltPwd release];
    [ltName release];


}

- (void)createMall {
    UIImageView *backthree = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    backthree.frame = self.view.frame;
    backthree.tag = 300;
    
    LTView *LTmall = [[LTView alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 40)];
    LTmall.textOfRight.placeholder = @"请输入邮箱";
    LTmall.labelOfLeft.text = @"Mall";
    backthree.userInteractionEnabled = YES;
    [backthree addSubview:LTmall];
    
    
    UIButton *btnMall = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnMall setTitle:@"取消" forState:UIControlStateNormal];
    [btnMall addTarget:self action:@selector(zhaoMall:) forControlEvents:UIControlEventTouchUpInside];
    btnMall.frame = CGRectMake(self.view.frame.size.width - 120, 220, 100, 30);
    
    [backthree addSubview:btnMall];
    
    [self.view addSubview:backthree];




}

- (void)createZhu {
    UIImageView *backtwo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    backtwo.tag = 200;
    backtwo.frame = self.view.frame;
    
    LTView *labelName = [[LTView alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 40)];
    labelName.labelOfLeft.text = @"name";
    labelName.textOfRight.placeholder = @"请输入用户名";
    
    LTView *labelPwd = [[LTView alloc] initWithFrame:CGRectMake(50, 140, self.view.frame.size.width - 100, 40)];
    labelPwd.textOfRight.placeholder = @"请输入密码";
    labelPwd.labelOfLeft.text = @"pwd";
    
    LTView *labelTel = [[LTView alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 40)];
    labelTel.labelOfLeft.text = @"tel";
    labelTel.textOfRight.placeholder = @"请输入电话号";
    
    LTView *labelMall = [[LTView alloc] initWithFrame:CGRectMake(50, 260, self.view.frame.size.width - 100, 40)];
    labelMall.textOfRight.placeholder = @"请输入邮箱";
    labelMall.labelOfLeft.text = @"mall";
    
    UIButton *btnZhu = [UIButton buttonWithType:UIButtonTypeSystem];
    btnZhu.frame = CGRectMake(self.view.frame.size.width - 80, 330, 40, 30);
    [btnZhu setTitle:@"取消" forState:UIControlStateNormal];
    [btnZhu addTarget:self action:@selector(qvAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [backtwo addSubview:btnZhu];
    [backtwo addSubview:labelMall];
    [backtwo addSubview:labelTel];
    
    [backtwo addSubview:labelPwd];
    
    [backtwo addSubview:labelName];
    backtwo.userInteractionEnabled = YES;
    [self.view addSubview:backtwo];


}

- (void)createUISeg {

    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"Log",@"Find",@"Zhu"]];
    seg.frame = CGRectMake(50, 500, self.view.frame.size.width - 100, 50);
    [seg addTarget:self action:@selector(Action:) forControlEvents:UIControlEventValueChanged];
    
    seg.selectedSegmentIndex = 0;
    [self.view addSubview:seg];
    [seg release];



}

- (void)Action:(UISegmentedControl *)seg {
    
    switch (seg.selectedSegmentIndex) {
        case 0:
            [self qvAction];
            [self.view bringSubviewToFront:seg];
            break;
        case 1:
            [self zhaoAction];
            [self.view bringSubviewToFront:seg];
            break;
        case 2:
            [self login];
            [self.view bringSubviewToFront:seg];
            
        default:
            break;
    }
    
    
}


- (void)zhaoMall {
    UIImageView *find = [self.view viewWithTag:100];
    [self.view bringSubviewToFront:find];
    
}

- (void)qvAction {
    UIImageView *find = [self.view viewWithTag:100];
    
    [self.view bringSubviewToFront:find];
    
}

- (void)login {
    UIImageView *find = [self.view viewWithTag:200];
    [self.view bringSubviewToFront:find];
    
    
}
- (void)zhaoAction {
    UIImageView *find = [self.view viewWithTag:300];
    [self.view bringSubviewToFront:find];
    
    
}

- (void)dealloc {
    
    [_imgBack release];
    [super dealloc];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
