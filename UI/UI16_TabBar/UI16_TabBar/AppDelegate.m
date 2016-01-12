//
//  AppDelegate.m
//  UI16_TabBar
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
    
    [self createTB];
    
    [_window release];
    return YES;
}
- (void)dealloc {
    [_window release];
    [_tb release];
    [super dealloc];
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
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    //设置TabBaritem
    navi.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:100];
    
    //item2 设置徽章
    Second *item2 = [[Second alloc] init];
    
    item2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:200];
    //设置违章
    item2.tabBarItem.badgeValue = @"99+";
    
    
    //item3 自定义图片
    Third *item3 = [[Third alloc] init];
    item3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:300];
    item3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"setting" image:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"2"]];
    
    
    
    


    //加入ViewController数组中
    self.tb.viewControllers = @[navi,item2,item3];
    //设置tabBar
    
    self.tb.tabBar.barTintColor = [UIColor blackColor];
    self.tb.tabBar.tintColor = [UIColor whiteColor];

    
    [navi release];
    [item2 release];
    [item3 release];
    
    

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    //选中vc的下标
    NSLog(@"%ld",self.tb.selectedIndex);
    
    //清空徽章
    if (self.tb.selectedIndex == 1) {
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
