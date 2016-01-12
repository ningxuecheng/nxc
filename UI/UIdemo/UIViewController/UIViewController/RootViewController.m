//
//  RootViewController.m
//  UIViewController
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "RootViewController.h"
#import "LTView.h"

@interface RootViewController () <UITextFieldDelegate>

@property (nonatomic, retain)UIImageView *imgback;


@end

@implementation RootViewController
#pragma mark - 知识点1 ViewController 生命周期

/** ViewController第一个方法,初始化方法,虽然前面调用的是init方法,但是
    无论调用何种初始化,都会调用此方法
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%s",__FUNCTION__);
        
    }
    return self;

}

/** 加载视图,ViewControll的view属性, 要指定一个view对象,如果系统检测view属性没有指向一个view对象,系统会自动创建一个view对象 */
- (void)loadView {
  /** 一定要调用父类方法 */
    [super loadView];
    NSLog(@"%s",__FUNCTION__);
}




/** 视图加载完成 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imgback = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    self.imgback.frame = self.view.frame;
    [self.view addSubview:self.imgback];
    [self.imgback release];
    
    /** 打开imageView用户交互 **/
    self.imgback.userInteractionEnabled = YES;
    
    /** 用户名和密码 */
    LTView *viewOfUser = [[LTView alloc] initWithFrame:CGRectMake(50, 350, self.view.frame.size.width - 100, 40)];
    
    
    [self.imgback addSubview:viewOfUser];
    
    viewOfUser.labelOfLeft.text = @"用户名:";
    viewOfUser.textOfRight.placeholder = @"请输入用户名";
    
    [viewOfUser release];
    
    LTView *viewOfPwd = [[LTView alloc] initWithFrame:CGRectMake(50, 420, self.view.frame.size.width - 100, 40)];
    
    viewOfPwd.textOfRight.placeholder = @"请输入密码";
    viewOfPwd.labelOfLeft.text = @"密码:";
    viewOfPwd.textOfRight.delegate = self;
    viewOfPwd.textOfRight.secureTextEntry = YES;
    viewOfUser.textOfRight.delegate = self;
    
    [_imgback addSubview:viewOfPwd];
    [viewOfPwd release];
    
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark = textField 协议方法

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

  /** 背景向上移动 */
    [UIView animateWithDuration:0.25 animations:^{
        self.imgback.frame = CGRectMake(0, -200, self.view.frame.size.width, self.view.frame.size.height);
        
    }];
    
    return YES;

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    /** 背景向上移动 */
    [UIView animateWithDuration:0.25 animations:^{
        self.imgback.frame = CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height);
        
    }];
    return YES;


}


/** 视图将要显示*/
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s",__FUNCTION__);
    
}

/** 视图已经显示 **/
- (void)viewDidAppear:(BOOL)animated {

    NSLog(@"%s",__FUNCTION__);
}
/** 视图将要消失 */
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s",__FUNCTION__);

}
/** 视图已经消失 */
- (void)viewDidDisappear:(BOOL)animated {

    NSLog(@"%s",__FUNCTION__);
}

/** ViewController可以检测到系统内存不足的警告,
    再此方法中,要释放适当内存 
  */
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
