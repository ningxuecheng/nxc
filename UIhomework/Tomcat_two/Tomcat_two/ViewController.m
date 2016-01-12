//
//  ViewController.m
//  Tomcat_two
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) UIImageView *imageViewBack;
@property (nonatomic, retain) NSMutableArray *arrAnimation;
@end

@implementation ViewController

- (void)dealloc {
    [_imageViewBack release];
    [_arrAnimation release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

#pragma mark - 背景
    self.imageViewBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"angry_0.jpg"]];

    self.imageViewBack.frame = self.view.frame;
    [self.view addSubview:self.imageViewBack];
    
    [_imageViewBack release];
    
#pragma mark - 6个按钮
    NSArray *arrButton = [NSArray arrayWithObjects:@"cymbal",@"drink",@"eat",@"fart",@"pie",@"scratch", nil];
    for (int i = 0 ; i < 6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(20 + ( i % 2) * 280, (i / 2) * 80 + 400, 60, 60);
        [button setBackgroundImage:[UIImage imageNamed:arrButton[i]] forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        /** button 添加标记, 目的,下面找到对应的button对象. */
        
        button.tag = 1 + i;
        
        /** 点击事件 */
        [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}
#pragma mark - 点击button实现动画
- (void)handleAction:(UIButton *)button {
    /** 当正在执行动画的时候,直接退出 */
    if (self.imageViewBack.isAnimating) {
        return;/** 从本方法(或函数)中直接返回,break为
                   退出本层循环,继续向下执行
                */
    }
    
    if (nil == _arrAnimation ) {
        self.arrAnimation = [NSMutableArray array];
    }
  
    switch (button.tag) {
        case 1:
            for (int i = 0; i < 13; i++) {
                NSString *name = [NSString stringWithFormat:@"cymbal_%d.jpg",i];
                UIImage *image = [UIImage imageNamed:name];
                [self.arrAnimation addObject:image];
            }
            break;
        case 2:
            for (int i = 0 ; i < 81 ; i++) {
                NSString *name = [NSString stringWithFormat:@"drink_%d.jpg",i];
                UIImage *image = [UIImage imageNamed:name];
                [self.arrAnimation addObject:image];

            }
            break;
        case 3:
            for (int i = 0 ; i < 40 ; i++) {
                NSString *name = [NSString stringWithFormat:@"eat_%d.jpg",i];
                UIImage *image = [UIImage imageNamed:name];
                [self.arrAnimation addObject:image];
                
            }
            break;
        case 4:
            for (int i = 0 ; i < 28 ; i++) {
                NSString *name = [NSString stringWithFormat:@"fart_%d.jpg",i];
                UIImage *image = [UIImage imageNamed:name];
                [self.arrAnimation addObject:image];
                
            }
            break;
        case 5:
            for (int i = 0 ; i < 24 ; i++) {
                NSString *name = [NSString stringWithFormat:@"pie_%d.jpg",i];
                UIImage *image = [UIImage imageNamed:name];
                [self.arrAnimation addObject:image];
                
            }
            break;
        case 6:
            for (int i = 0 ; i < 56 ; i++) {
                NSString *name = [NSString stringWithFormat:@"scratch_%d.jpg",i];
                UIImage *image = [UIImage imageNamed:name];
                [self.arrAnimation addObject:image];
                
            }
            break;
        default:
            break;
    }
    self.imageViewBack.animationDuration = self.arrAnimation.count * 0.1;
    self.imageViewBack.animationImages = self.arrAnimation;
    self.imageViewBack.animationRepeatCount = 1;
    [self.imageViewBack startAnimating];
   
    /** 动画播放完之后,请空数组, 方法1: */
    [self performSelector:@selector(clearArr) withObject:nil afterDelay:self.imageViewBack.animationDuration ];
    /**
     * Person 有个name属性, 系统自动创建一个_name实例变量, 自动生成setter和getter方法.
     setName:方法, name方法.
     *
     * UIImageView 有个属性 animationImages.
     * 那个这个属性系统会自动生成setter方法,和getter方法. 即:setAnimationImages:方法, animationImages方法.
     */
    
    /** 方法二:  */
    [self.imageViewBack performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imageViewBack.animationDuration];

    


}
- (void)clearArr {

    [self.arrAnimation removeAllObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
