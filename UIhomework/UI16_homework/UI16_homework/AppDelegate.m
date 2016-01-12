//
//  AppDelegate.m
//  UI16_homework
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Second.h"
#import "Third.h"
@interface AppDelegate () <UITabBarControllerDelegate>
@property (nonatomic, retain) UITabBarController *tb;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createTabBar];
    return YES;
}

- (void)dealloc {
    [_window release];
    [super dealloc];

}


- (void)createTabBar {
    self.tb = [[UITabBarController alloc] init];
    
    self.window.rootViewController = self.tb;
    [self createTBitem];
    
//    self.tb.tabBar.tintColor = [UIColor whiteColor];
//    self.tb.tabBar.barTintColor = [UIColor blackColor];
    self.tb.tabBar.barStyle = 1;
    self.tb.delegate = self;
    [_tb release];

}

- (void)createTBitem {

    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:vc];

    navi1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[[UIImage imageNamed:@"1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:100];
    
    
    
    Second *sec = [[Second alloc] init];
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:sec];
    navi2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"联系人" image:[[UIImage imageNamed:@"2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:200];
    
    Third *third = [[Third alloc] init];
    UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:third];
    third.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"动态" image:[[UIImage imageNamed:@"3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:300];
    third.tabBarItem.badgeValue = @"6+";


    self.tb.viewControllers = @[navi1,navi2,navi3];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    if (self.tb.selectedIndex == 2) {
        viewController.tabBarItem.badgeValue = nil;
    }

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
