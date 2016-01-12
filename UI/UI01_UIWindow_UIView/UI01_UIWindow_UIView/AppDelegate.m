//
//  AppDelegate.m
//  UI01_UIWindow_UIView
//
//  Created by dllo on 15/12/14.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - 知识点1 UIWindow
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    /** 当程序对象加载完成(在内存中开辟空间)后, 调用此协议方法. */
    
    /** 才在协议方法中,通常创建UIWindow对象,UIViewController对象,其他控件对象 */
    
    
    /** 创建UIWindow对象, 及相关设置. 
      * 和主屏幕([UIScreen mainScreen])等大
      */
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    /** 背景颜色, 注意颜色是一个对象(UIColor). */
    self.window.backgroundColor = [UIColor orangeColor];
    
    /** window设置为主window并可见 */
    
    [self.window makeKeyAndVisible];
    
    /** 创建一个viewController对象. */
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    /** 将vc设置为windows根视图控制器 */
    
    self.window.rootViewController = vc;
#pragma mark - 知识点3 UIView
    /**
     * 当接触到一个新类,首先看是否有自己的初始化方法(构造器方法).
     * 如果没有自己特有的初始化方法,找父类的初始化方法, 以此类推
     *
     */
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    /** 添加到window上*/
    [self.window addSubview:view1];
    /** 查看一下window 的子视图 */
    NSLog(@"%@",self.window.subviews);
    /** 内存管理 */
    [view1 release];
    /**
     创建UIView对象：
     设置frame x = 100，y = 200 ，w = 100 ，h = 100
     设置背景色为蓝色
     添加到window上
     把view放到屏幕中心位置
     设置透明度50%
     打印它的父视图
     打印它的子视图
     通过tag值把背景色改为红色*/
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [self.window addSubview:view2];
    /** 中心点属性 */
    view2.center = self.window.center;
    /* 透明度 */
     view2.alpha = 0.2f;
    /** 父视图 */
     NSLog(@"父视图%@",view2.superview);
     /** 子视图 */
     NSLog(@"子视图%@",view2.subviews);
      /** tag 是UIView的一个属性.做一个标记 目的通过tag找到标签*/
    view2.tag = 100;
    /** 通过标签找到属性 */
     UIView *findView = [self.window viewWithTag:100];
    findView.backgroundColor = [UIColor redColor];
    
    
    
//    练习要求：新建一个工程，创建5个视图(aView、bView、cView、dView、eView)
//1、window用addSubview:方法先后添加aView和bView。
//2、window用insertSubview:atIndex:方法把cView添加到aView和bView之间。
//3、window用insertSubview:aboveSubview:方法把dView添加到aView的上面。
//4、window用insertSubview:belowSubview:方法把eView添加到bView的下面。
    
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(101, 400, 100, 100)];
    aView.tag = 1000;
    aView.backgroundColor = [UIColor redColor];
    UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(150, 400, 100, 100)];
    bView.tag = 2000;
    bView.backgroundColor = [UIColor grayColor];
    UIView *cView = [[UIView alloc] initWithFrame:CGRectMake(200, 400, 100, 100)];
    cView.backgroundColor = [UIColor redColor];
    UIView *dView = [[UIView alloc] initWithFrame:CGRectMake(250, 400, 100, 100)];
    cView.tag = 3000;
    dView.backgroundColor = [UIColor blackColor];
    UIView *eView = [[UIView alloc] initWithFrame:CGRectMake(300, 400, 100, 100)];
    dView.tag = 4000;
    eView.backgroundColor = [UIColor blueColor];
    eView.tag = 5000;
    [self.window addSubview:aView];
    [self.window addSubview:bView];
    [self.window insertSubview:cView atIndex:4];
    [self.window insertSubview:dView aboveSubview:aView];
    [self.window insertSubview:eView belowSubview:bView];
    
    //[aView release];
    [bView release];
    [cView release];
    [dView release];
    [eView release];
 
#pragma mark - 知识点4 UIBotton (了解)
    
    
    /** 1.*/
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(220, 100, 100, 50);
    button.backgroundColor = [UIColor whiteColor];
    /**设置标题*/
    [button setTitle:@"点击" forState:normal];
    [self.window addSubview:button];
      /** button 点击事件
      * self 指 Appdetegate对象 
      * @selector, appdelegate的对象 
      * 控制事件, 选择touchupinside.
      */
    
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    
   /* 练习要求：创建一个Button，在点击方法里面，调整练习3的视图层级：
    1、window把aView移动到最前面。
    2、window把bView移动到最后面。
    3、window交换dView和eView。
    4、把cView从父视图上移除
    */
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button2.frame = CGRectMake(20, 600, self.window.frame.size.width - 40, 30);
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"换" forState:normal];
    [self.window addSubview:button2];
    
    [button2 addTarget:self action:@selector(exchang:) forControlEvents:UIControlEventTouchUpInside];
    
    
#pragma mark - 知识点2 MRC 下的内存管理
    
    
    [vc release];
    [_window release];
    
    
    
    
 
    
    
    
    
    
    return YES;
}

#pragma mark - button 点击事件

- (void)handleAction:(UIButton *)button {

    NSLog(@"点击");
}

- (void)exchang:(UIButton *)button {

    UIView *aview = [self.window viewWithTag:1000];
    UIView *bview = [self.window viewWithTag:2000];
    UIView *cview = [self.window viewWithTag:3000];
    UIView *dview = [self.window viewWithTag:4000];
    UIView *eview = [self.window viewWithTag:5000];
    
    [self.window bringSubviewToFront:aview];
    [self.window sendSubviewToBack:bview];
    [self.window exchangeSubviewAtIndex:4 withSubviewAtIndex:6];
    [cview removeFromSuperview];
}
#pragma mark - 重写delloc方法

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
