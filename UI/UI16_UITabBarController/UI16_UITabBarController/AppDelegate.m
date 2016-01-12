//
//  AppDelegate.m
//  UI16_UITabBarController
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VCForitem2.h"
#import "VCForitem3.h"
#import "VCForitem4.h"
#import "VCForitem5.h"
#import "VCForitem6.h"
@interface AppDelegate () <UITabBarControllerDelegate>
@property (nonatomic, retain) UITabBarController *tb;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    

    
    
    [self createTabBarController];
    
    
    [_window release];
    
    
    return YES;
}


#pragma mark - 知识点1 UITabBarController
- (void)createTabBarController {

    //创建对象
    self.tb = [[UITabBarController alloc] init];
    //viewControllers属性
    [self createViewControllers];
    
    self.tb.delegate = self;
    
    
    
    
    self.window.rootViewController = self.tb;
    [self.tb release];
    
    
    


}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    //选中vc的下标
    NSLog(@"%ld",self.tb.selectedIndex);
    
    //清空徽章
    if (self.tb.selectedIndex == 1) {
       viewController.tabBarItem.badgeValue = nil;
    }
    
    //设置tabbar
    
    // self.tb.tabBar.barTintColor = [UIColor blackColor];
    // self.tb.tabBar.tintColor = [UIColor whiteColor];

    
}


- (void)createViewControllers {
//item1
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
   
    
    //设置tabbaritem
    navi.tabBarItem =[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:100];
    
    
    
    
//item2 设置徽章
    
    VCForitem2 *item2 = [[VCForitem2 alloc] init];

    item2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:200];
    
    //设置违章
    item2.tabBarItem.badgeValue = @"99+";
    
    
//item3 自定义图片
    VCForitem3 *item3 = [[VCForitem3 alloc ] init];
    item3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem: UITabBarSystemItemDownloads tag:300];
    item3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"setting" image:[[UIImage imageNamed:@"1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:300];
    
    
    
//item4 自定义图片 + 选中之后的图片
    VCForitem4 *item4 = [[VCForitem4 alloc] init];
    item4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"fast" image:[UIImage imageNamed:@"2"] selectedImage:[UIImage imageNamed:@"3"]];
    
//item5
    VCForitem5 *item5 = [[VCForitem5 alloc] init];
    item5.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:500];
    
    
//item6
    VCForitem6 *item6 = [[VCForitem6 alloc] init];
    item6.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:600];
    
    //加入ViewController数组中
    self.tb.viewControllers = @[navi,item2,item3,item4,item5,item6];
    
    
    
     [vc release];

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
