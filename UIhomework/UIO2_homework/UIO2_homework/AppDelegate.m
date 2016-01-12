//
//  AppDelegate.m
//  UIO2_homework
//
//  Created by dllo on 15/12/15.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/**使 代码 成如图所 的界
 需求:
 1. 键盘能够回收,提 点击按钮的时候键盘能回收,核 代码:[输 框
 resignFirstResponder];
 2. 密码和确认密码设置密 输  3.  机号使 数字键盘*/


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    UIViewController *vc = [[UIViewController alloc] init];
    self.window.rootViewController = vc;
    
    [self imageView];
    //[self labelView];
    [self guaView];
    [self zombieImg];
    [self flowerView];
    [self BZombieView];
    [vc release];
    [_window release];
    
    
    
    return YES;
}

- (void)labelView {
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    labelName.text = @"用户名:";
    labelName.textColor = [UIColor blackColor];
    
    UILabel *labelPwd = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    labelPwd.text = @"密码:";
    labelPwd.textColor = [UIColor blackColor];
    
    UILabel *labelCirm = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    labelCirm.text = @"确认密码:";
    labelCirm.textColor = [UIColor blackColor];
    
    UILabel *labelTel = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    labelTel.text = @"电话号码:";
    labelTel.textColor = [UIColor blackColor];
    
    UILabel *labelMail = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 100, 40)];
    labelMail.text = @"电子邮箱:";
    labelMail.textColor = [UIColor blackColor];
    [self.window addSubview:labelMail];
    [self.window addSubview:labelTel];
    [self.window addSubview:labelCirm];
    [self.window addSubview:labelPwd];
    [self.window addSubview:labelName];
    [labelMail release];
    [labelTel release];
    [labelPwd release];
    [labelName release];
    [labelCirm release];

}

- (void)imageView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackGround"]];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height );

    [self.window addSubview:imageView];
    [imageView release];

}

- (void)zombieImg {
    
    UIImageView *zombieArr = [[UIImageView alloc] initWithFrame:CGRectMake(300, 50, 60, 100)];
    
     NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0 ; i < 22; i++) {
        NSString *str = [NSString stringWithFormat:@"Zombie%d",i];
        
        // 图  件路径
        NSString *path = [[NSBundle mainBundle]
                          pathForResource:str ofType:@"tiff"];
        // 创建 个UIImage对象,使 initWithContentOfFile:  法
        UIImage *image = [UIImage
                          imageWithContentsOfFile:path];
        [arr addObject:image];
    }
    zombieArr.animationImages = arr;
    zombieArr.animationDuration = 1;
    zombieArr.animationRepeatCount = 0;
    [zombieArr startAnimating];
    [UIView animateWithDuration:10 animations:^{
       
            
    zombieArr.frame = CGRectMake(-60, 50, 60, 100);
        
        
    }];
    [self.window addSubview:zombieArr];
    [zombieArr release];
}

- (void)guaView {
    UIImageView *guaArr = [[UIImageView alloc] initWithFrame:CGRectMake(50, 70, 60, 100)];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 1 ; i < 17; i++) {
        NSString *str = [NSString stringWithFormat:@"gua%d",i];
        NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"tiff"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arr addObject:image];
        
    }
    guaArr.animationImages = arr;
    guaArr.animationDuration = 1;
    guaArr.animationRepeatCount = 0;
    [guaArr startAnimating];
    [self.window addSubview:guaArr];
    [guaArr release];


}

- (void)flowerView {
    UIImageView *flowerArr = [[UIImageView alloc] initWithFrame:CGRectMake(50, 150, 60, 100)];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 1 ; i < 19; i++) {
        NSString *str = [NSString stringWithFormat:@"flower%d",i];
        NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"tiff"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arr addObject:image];
    }
    flowerArr.animationImages = arr;
    flowerArr.animationDuration = 1;
    flowerArr.animationRepeatCount = 0;
    [flowerArr startAnimating];
    
    [self.window addSubview:flowerArr];
    [flowerArr release];
    
    


}

- (void)BZombieView {
    UIImageView *BZombieArr = [[UIImageView alloc] initWithFrame:CGRectMake(300, 150, 60, 100)];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 1; i < 26; i++) {
        NSString *str = [NSString stringWithFormat:@"BZombie%d",i];
        NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"tiff"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arr addObject:image];
        
    }
    BZombieArr.animationImages = arr;
    BZombieArr.animationDuration = 1;
    BZombieArr.animationRepeatCount = 0;
    [BZombieArr startAnimating];
    [UIView animateWithDuration:20 animations:^{
        
        
        BZombieArr.frame = CGRectMake(-60, 150, 60, 100);
        
        
    }];

    [self.window addSubview:BZombieArr];
    [BZombieArr release];



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
