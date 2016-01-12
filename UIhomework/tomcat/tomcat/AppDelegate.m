//
//  AppDelegate.m
//  tomcat
//
//  Created by dllo on 15/12/15.
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
    
    [self imageView];
       [vc release];
    [_window release];
    
    
    
    return YES;
}

- (void)imageView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eat_0.jpg"]];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height );
    
    
    UIButton *btnEat = [UIButton buttonWithType:UIButtonTypeSystem];
    btnEat.frame = CGRectMake(0, 0, 50, 50);
    
  
    NSString *path = [[NSBundle mainBundle]pathForResource:@"myeat" ofType:@"png"];
   
    [btnEat setBackgroundImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
    
    [btnEat addTarget:self action:@selector(eatAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.window addSubview:imageView];
      [self.window addSubview:btnEat];
    
    [imageView release];
    
}



- (void)eatAction:(UIButton *)button {
    [self eatView];


}
- (void)eatView {
    UIImageView *eatView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 40; i++) {
        NSString *str = [NSString stringWithFormat:@"eat_%d",i];
        NSString *path = [[NSBundle mainBundle]pathForResource:str ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arr addObject:image];
    }
    
    eatView.animationImages = arr;
    eatView.animationDuration = 3;
    eatView.animationRepeatCount = 1;
    [eatView startAnimating];
    [self.window addSubview:eatView];
    [eatView release];
    [arr removeAllObjects];
    [arr release];



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
