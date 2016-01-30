//
//  AppDelegate.m
//  Project_A
//
//  Created by dllo on 16/1/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "VCTravels.h"
#import "MyVC.h"
#import "NewsVC.h"
@interface AppDelegate () <UITabBarControllerDelegate>
@property (nonatomic, retain) UINavigationController *navi;
@property (nonatomic, retain) UITabBarController *tb;
@end

@implementation AppDelegate

- (void)dealloc {
    [_tb release];
    [_navi release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
  
    
    [self createTB];
    
    [_window release];
   
    
    return YES;
}

- (void)createTB {
    self.tb = [[UITabBarController alloc] init];
    
    [self createViewControllers];
    self.tb.delegate = self;
    
    self.window.rootViewController = self.tb;
    [self.tb release];
}

- (void)createViewControllers {
    
    //item1
    VCTravels *vc = [[VCTravels alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [vc release];
    //设置TabBaritem
    navi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"游记" image:[UIImage imageNamed:@"iconfont-weiyouji"] selectedImage:nil];
    
    MyVC *my = [[MyVC alloc] init];
    
    my.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"iconfont-wode"] selectedImage:nil];
    
    NewsVC *new = [[NewsVC alloc] init];
    new.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[UIImage imageNamed:@"iconfont-xinwen-2"] selectedImage:nil];
    
    //加入ViewController数组中
    self.tb.viewControllers = @[navi,new,my];
    [my release];
    //设置tabBar
    
//    self.tb.tabBar.barTintColor = [UIColor blackColor];
//    self.tb.tabBar.tintColor = [UIColor whiteColor];
    
    
    [navi release];
    
    
    
    
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
