//
//  UCRootViewController.m
//  UI03_homework
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "UCRootViewController.h"
#import "LTView.h"
@interface UCRootViewController ()

@property (nonatomic, retain)UIImageView *imgBack;
@property (nonatomic, retain)NSMutableArray *arr;

@end

@implementation UCRootViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    /** 二 */
    
    
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
    
    
    
    // 3
    
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
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)zhaoMall:(UIButton *)button {
    UIImageView *find = [self.view viewWithTag:100];
    [self.view bringSubviewToFront:find];

}

- (void)qvAction:(UIButton *)button {
    UIImageView *find = [self.view viewWithTag:100];

    [self.view bringSubviewToFront:find];

}

- (void)login:(UIButton *)button {
    UIImageView *find = [self.view viewWithTag:200];
    [self.view bringSubviewToFront:find];
   

}
- (void)zhaoAction:(UIButton *)button {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
