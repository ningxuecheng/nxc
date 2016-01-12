//
//  AppDelegate.m
//  UI01_UIWindow
//
//  Created by dllo on 15/12/14.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    self.window.rootViewController = vc;
#if 0
//    创建5个UIView
//    要求 ：
//    1.命名 view1 ~ view5
//    2.分别设置背景颜色红、黄、绿、蓝、灰
//    3.位置与大小自定义。
//    4.设置UIView常用属性。（数据自定）
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.window addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    view2.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
    view3.backgroundColor = [UIColor greenColor];
    [self.window addSubview:view3];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
    view4.backgroundColor = [UIColor blueColor];
    [self.window addSubview:view4];
    
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view5.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view5];
    
    
    [view5 release];
    [view4 release];
    [view3 release];
    [view2 release];
    [view1 release];

    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 80, 30)];
    view1.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view1];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 80, 30)];
    view2.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(150, 50, 150, 30)];
    view3.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view3];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 150, 30)];
    view4.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view4];
    
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(80, 150, 80, 40)];
    view5.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view5];
    
    
    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(180, 150, 80, 40)];
    view6.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view6];
#endif
    float w = [UIScreen mainScreen].bounds.size.width / 5.0f;
    float h = [UIScreen mainScreen].bounds.size.height / 8.0f;
    
    
        
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 8; j++) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(w * i, h * j, w, h)];
                float f1 = (arc4random() % (1000 - 1 + 1) + 1) / 1000.000f ;
                float f2 = (arc4random() % (1000 - 1 + 1) + 1) / 1000.000f ;
                float f3 = (arc4random() % (1000 - 1 + 1) + 1) / 1000.000f ;
                
                
                view.backgroundColor = [[UIColor alloc] initWithRed:f1 green:f2 blue:f3 alpha:1];
                view.tag = i + j * 5;
                
                [self.window addSubview:view];
                
                
                
                [view release];
                
            }
        }
    
    
    

    
    
    
    
    
    
    
    [vc release];
    [_window release];
    
    
    
    
    
    
    
    
    
    return YES;
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
