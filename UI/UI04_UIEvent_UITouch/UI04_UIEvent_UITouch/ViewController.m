//
//  ViewController.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
#import "moveView.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
#define WHITE  [UI]
@interface ViewController () <TouchViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self touchEvent];
    [self moveView];
}

#pragma mark - 知识点1 事件(UIEvent)

/** UIEvent 有三种事件,触摸(UITouch),摇晃,远程控制
    本节课重点是触摸事件(UITouch)
 */
#pragma mark - 知识点2 触摸

- (void)touchEvent {
/** 触摸就是硬件能感应到一个手指 触摸屏幕
    重点: 触摸之后的操作. (重写Touch相关的方法(开始触摸 触摸移动 触摸结束))
 */
    
    /** 创建一个自定义View(TouchView) */
    TouchView *viewTouch = [[TouchView alloc] initWithFrame:CGRectMake(50, 50, WIDTH - 100, 50)];
    viewTouch.backgroundColor = [UIColor redColor];
    viewTouch.textFieldCont.placeholder = @"触摸";
    [self.view addSubview:viewTouch];
    [viewTouch release];
    
    viewTouch.delegate = self;
}

- (void)changeColor {

    self.view.backgroundColor = [UIColor whiteColor];

}


#pragma mark - 知识点3 控件随着手指移动

- (void)moveView {


    MoveView *moveView = [[MoveView alloc] initWithFrame:CGRectMake(100, 150, 50, 50)];
    moveView.tag = 100;
    moveView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:moveView];
    [moveView release];


}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    NSLog(@"vc响应移动");
//    /** 从参数touches里面获取UITouch对象(手指). */
//    UITouch *t = [touches anyObject];
//    /** 获取UITouch 在View上的坐标 */
//  CGPoint point = [t locationInView:self.view];
//    NSLog(@"%f, %f",point.x,point.y);
//    
//    /** 使moveView的中心点 和 手指的坐标点一样 */
//    MoveView *view = [self.view viewWithTag:100];
//    if (t.view == view) {
//        view.center = point;
//        
//    }
//    
//    
//}


#pragma mark - 响应者链 
/** 
  * UIResponder 类(响应者类)
  * 是个抽象类 (不能用抽象类直接创键对象),用他的子类
  * UIView UIViewController UIApplication等都是他的子类
  * 响应者链就是有UIResponder子类对象组成的图层关系
 */

#pragma mark - 点击空白区域, 回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    NSLog(@"响应触摸开始");
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
    NSLog(@"响应触摸结束");
    self.view.backgroundColor = [UIColor orangeColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
