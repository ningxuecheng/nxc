//
//  ViewController.m
//  UI26_Animation
//
//  Created by dllo on 16/1/18.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *viewForWhite;
@property (weak, nonatomic) IBOutlet UIView *viewForGreen;
@property (weak, nonatomic) IBOutlet UIView *viewWhite;

@end

@implementation ViewController

#pragma mark - 知识点1：UIView实现动画（1/2）
- (IBAction)handleView1:(id)sender {
    //API 1：
//    [UIView animateWithDuration:2 animations:^{
//        //设置控件属性值
//        self.viewForGreen.frame = CGRectMake(0, 200, self.view.frame.size.width, 120);
//        self.viewForGreen.backgroundColor = [UIColor blackColor];
//    }];
   //API 2;
//    [UIView animateWithDuration:2 animations:^{
//        //设置控件属性值
//        self.viewForGreen.frame = CGRectMake(0, 200, self.view.frame.size.width, 120);
//        self.viewForGreen.backgroundColor = [UIColor blackColor];
//        
//    } completion:^(BOOL finished) {
//        self.viewForGreen.backgroundColor = [UIColor greenColor];
//    }];

    //API 3: options 参数控制动画效果。
//    [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
//        self.viewForGreen.frame = CGRectMake(0, 200, 375, 120);
//        self.viewForGreen.backgroundColor = [UIColor redColor];
//    } completion:^(BOOL finished) {
//        
//    }];
    
    //API4:
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:10 options:0 animations:^{
        [UIView setAnimationRepeatCount:2];
        self.viewForGreen.frame = CGRectMake(0, 200, 375, 182);
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark - 知识点2：UIView实现动画（2/2）
- (IBAction)handleView:(id)sender {
    //准备开始动画
    [UIView beginAnimations:@"abc" context:nil];
    //设置动画参数
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:CGFLOAT_MAX];
    [UIView setAnimationRepeatAutoreverses:YES];
    //控件属性的更改
    self.viewForGreen.frame = CGRectMake(0, 200, 375, 182);
    //提交动画
    [UIView commitAnimations];
}

#pragma mark - 知识点3 CABasicAnimation

- (IBAction)handleBasic:(id)sender {
    //创建对象
    CABasicAnimation *basic= [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    
    //动画对象的api设置
    basic.fromValue = @1;
    basic.toValue = @0.5;
    
    basic.duration = 1;
    basic.autoreverses = YES;
    basic.repeatCount = CGFLOAT_MAX;
    
    
    
    //layer层上添加对象
    [self.viewForGreen.layer addAnimation:basic forKey:@"basic"];
    
    
    
}
#pragma mark - 知识点4 CAAnimationGroup
- (IBAction)handleGroup:(id)sender {
    //创建动画组对象
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *basic1 = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    
    basic1.fromValue = @1;
    basic1.toValue = @0.5;
    
    CABasicAnimation *basic2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basic2.fromValue = @0;
    basic2.toValue = @M_PI;
    
    group.duration = 2;
    group.autoreverses = YES;
    group.repeatCount = CGFLOAT_MAX;
    
    group.animations = @[basic1,basic2];
    
    //layer曾添加对象
    [self.viewForGreen.layer addAnimation:group forKey:@"grouop"];
}

#pragma mark - 知识点5 CAKeyframeAnimation
- (IBAction)handleKeyframeAnimation:(id)sender {
    //创建动画对象
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置动画的api
    //通过函数创建CGPathRef结构体
    CGMutablePathRef path = CGPathCreateMutable();
    //起始点
    CGPathMoveToPoint(path, nil, self.viewWhite.center.x, self.viewWhite.center.y);
    //路径经过的点 直线移动
//    CGPathAddLineToPoint(path, nil, 200, 200);
//    CGPathAddLineToPoint(path, nil, 200, 300);
//    CGPathAddLineToPoint(path, nil, 300, 300);
    
    //路径经过的点 去线移动
    CGPathAddCurveToPoint(path, nil, self.viewWhite.center.x, self.viewWhite.center.y, self.viewWhite.center.x, self.viewWhite.center.y + 100, self.viewWhite.center.x + 100, self.viewWhite.center.y + 100);
    keyFrame.path = path;
    keyFrame.duration = 2;
    keyFrame.autoreverses = YES;
    keyFrame.repeatCount = 2;
    
    //layer曾添加动画
    [self.viewWhite.layer addAnimation:keyFrame forKey:@"keyframe"];
}

#pragma mark - 知识点6 CATransition
- (IBAction)handleTranstion:(id)sender {
    //创建动画对象
    CATransition *trans = [CATransition animation];
    
    //设置动画api
    trans.type = @"rippleEffect";
   
    trans.duration = 2;
    trans.autoreverses = YES;
    trans.repeatCount = 2;
    
    
    
    //layer上面添加动画
    [self.viewForGreen.layer addAnimation:trans forKey:@"trans"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
