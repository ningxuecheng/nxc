//
//  AppDelegate.m
//  UI02_UILable_UITextField_UIButton_UIImageView
//
//  Created by dllo on 15/12/15.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UITextFieldDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    self.window.rootViewController = vc;
    
    [self lableView];

    [self textFieldView];
    [self buttonView];
    
    
    [self imageView];
    
    [vc release];
    [_window release];
    
    
    
    
    return YES;
}

#pragma mark - 知识点1 UILable

- (void)lableView {
    /** 1.创建对象 */
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 80, 30)];
     labelName.backgroundColor = [UIColor blueColor];
    [self.window addSubview:labelName];
    [labelName release];
    /** 2.常用API */
    labelName.text = @"用户名:";
    labelName.textColor = [UIColor whiteColor];
    /** 文本对齐 */
    labelName.textAlignment = NSTextAlignmentRight;
    /** 文本字体 */
    labelName.font = [UIFont systemFontOfSize:20];
    /** 文本行数, 0是没有行数限制. */
    labelName.numberOfLines = 3;
    
    /** 省略模式*/
    labelName.lineBreakMode = NSLineBreakByTruncatingHead;
    /** 阴影效果*/
    labelName.shadowColor = [UIColor redColor];
    /** 阴影的偏移量*/
    labelName.shadowOffset = CGSizeMake(2, 2);

    UILabel *lablePwd = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 80, 30)];
    lablePwd.backgroundColor = [UIColor blueColor];
    lablePwd.text = @"密码:";
    lablePwd.textColor = [UIColor whiteColor];
    lablePwd.textAlignment = NSTextAlignmentRight;
    lablePwd.font = [UIFont systemFontOfSize:20];
    lablePwd.shadowOffset = CGSizeMake(2, 2);
    lablePwd.shadowColor = [UIColor redColor];
    
    
    [self.window addSubview:lablePwd];
    [lablePwd release];
    
    
}



#pragma mark - 知识点2 UITextField
- (void)textFieldView {
/** 1.创建对象 */
    UITextField *textOfName = [[UITextField alloc] initWithFrame:CGRectMake(150, 50, 160, 30)];
    //textOfName.backgroundColor = [UIColor blueColor];
    /** 2.API*/
    textOfName.borderStyle = UITextBorderStyleLine;
    /** 占位符 */
    textOfName.placeholder = @"请输入用户名";
    /** 清除 */
    textOfName.clearButtonMode = UITextFieldViewModeWhileEditing;
    /** 安全输入 */
    textOfName.secureTextEntry = NO;
     /** 弹出键盘的类型 */
    textOfName.keyboardType = UIKeyboardTypeDefault;
    /** 弹出键盘的风格 */
    textOfName.keyboardAppearance = UIKeyboardTypeDecimalPad;
    /** 键盘回车按键 */
    textOfName.returnKeyType = UIReturnKeyNext;
     /** 练习:添加密码textField. **/
    
    UITextField *textOfPwd = [[UITextField alloc] initWithFrame:CGRectMake(150, 100, 160, 30)];
    textOfPwd.placeholder = @"请输入密码";
    textOfPwd.secureTextEntry = YES;
    textOfPwd.borderStyle = UITextBorderStyleRoundedRect;
    textOfPwd.keyboardAppearance = UIKeyboardTypeDecimalPad;
    
    /** 输入框后面的 清除按键**/
    textOfPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    textOfPwd.tag = 200;
    textOfName.tag = 100;
#pragma mark ** textField delegate
    
    /** 指定代理人. */
    textOfPwd.delegate = self;
    textOfName.delegate = self;
    
    
    [self.window addSubview:textOfPwd];
    [self.window addSubview:textOfName];
    [textOfPwd release];
    [textOfName release];

}

#pragma mark - textField 协议方法
  /** 将要开始编辑的事后,调用此方法 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
     return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
   NSLog(@"%s %d",__FUNCTION__,__LINE__);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
    UITextField *txtpwd = [self.window viewWithTag:200];
    UITextField *txtname = [self.window viewWithTag:100];
    /** 回收键盘 */
     if (textField.returnKeyType != UIReturnKeyNext) {
      /** 释放第一响应者 */
        [textField resignFirstResponder];
    }else {
        [textField resignFirstResponder];
        [txtpwd becomeFirstResponder];
    }
    return YES;
}
/** 清空内容时 调用此方法 */
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
    return YES;
}
/** 内容发生变化时调用此方法 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"string:%@",string);
    NSLog(@"%ld %ld",range.length,range.location);
    /** 限制输入个数*/
    if (range.location > 7) {
        return NO;
    }
     /** 不能输入的内容 */
    if ([string isEqualToString:@"w"]) {
        return NO;
    }
    return YES;
}
#pragma mark - 知识点3 UIButton
- (void)buttonView {
/** 创建系统默认类型button */
    UIButton *btnOfComfirm = [UIButton buttonWithType:UIButtonTypeSystem];
    btnOfComfirm.frame = CGRectMake(70, 150, 100, 40);
    /** 2.API */
    
    [btnOfComfirm setTitle:@"确定" forState:UIControlStateNormal];
    
    [btnOfComfirm setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    
    /** 添加事件 */
    [btnOfComfirm addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:btnOfComfirm];
    
}

- (void)handleAction:(UIButton *)button {
    /** 验证用户名和密码是否正确 */
    UITextField *tfUser = [self.window viewWithTag:100];
    UITextField *tfPwd = [self.window viewWithTag:200];
    
    /** 释放键盘
      * endingEditing 是view 的方法, 功能:释放view以及他的子视图的第一状态
      */
//    [tfPwd resignFirstResponder];
//    [tfUser resignFirstResponder];
    
    [self.window endEditing:YES];
    
    
    if ([tfUser.text isEqualToString:@"tom"] && [tfPwd.text isEqualToString:@"123456"]  ) {
        NSLog(@"匹配");
    }else{
    
        NSLog(@"用户名/密码错误");
    }

}

#pragma mark - 知识点4 UIImageView
- (void)imageView {
/** 1.创建对象 */
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    imgView.frame = CGRectMake(50, 250, 300, 500);
    [self.window addSubview:imgView];
    
    
    UIButton *btnIcon = [UIButton buttonWithType:UIButtonTypeSystem];
    btnIcon.frame = CGRectMake(200, 200, 60, 60);
    [self.window addSubview:btnIcon];
    
    [btnIcon setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    
    
    [imgView release];


}



- (void)dealloc {

    [_window release];
    [super dealloc];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
