//
//  AppDelegate.m
//  UI93_desin_View
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "LTView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *vc = [[UIViewController alloc] init];
    self.window.rootViewController = vc;
    [self createCustomView];
    
    
    [vc release];
    [_window release];
    
    
    return YES;
}

#pragma mark - 知识点1 自定义View
- (void)createCustomView {

/** 需要一种控件(类), 这个控件中有一个label, 一个textField. 
 * 因为系统没有此性质的类
 * 因此创建一个雷
 */
    /** 创建对象 */
    LTView *ltview = [[LTView alloc] initWithFrame:CGRectMake(20, 80, self.window.frame.size.width - 49, 40)];
    
    ltview.labelOfLeft.text = @"用户名:";
    ltview.textOfRight.placeholder = @"请输入用户名";
    
    [self.window addSubview:ltview];
    [ltview release];
    
    
    


}
#pragma mark -


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
