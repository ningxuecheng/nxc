//
//  ViewController.m
//  UI29_Block
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
#import "NetworkingHandler.h"
/** 函数的声明*/

int sum(int, int);

/** 函数的实现 */
int sum(int x,int y) {

    return x+y;
}

int sub(int x, int y) {
    return x - y;
}

@interface ViewController ()

@property (nonatomic, copy) void (^block)(NSString *);

@property (weak, nonatomic) IBOutlet TouchView *touchview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self functionReview];
    [self studyBlock];
    [self.touchview viewDidClick:^(TouchView *view) {
        NSLog(@"点击view");
    }];
  
    
    [self.touchview buttonHandle:^(UIButton *deleBtn) {
        NSLog(@"点击btn");
    }];
    
    [self.touchview buttonHandle:^(UIButton *deleBtn) {
        NSLog(@"点击delbtn");
    } editBtn:^(UIButton *editBtn) {
         NSLog(@"点击editBtn");
    }];
    [self handleData];
    
}

#pragma mark - 数据处理（网络类使用block回调）
- (void)handleData{


[NetworkingHandler netWorkingWithURL:@"http://api.map.baidu.com/place/v2/search?query=银行&region=大连&output=json&ak=6E823f587c95f0148c19993539b99295" completeHandle:^(NSURLResponse *response, NSData *data, id result) {
      NSLog(@"%@",result);
}];




}





#pragma mark - 复习函数
- (void)functionReview {

/** 函数有三部分：函数的声明， 函数的实现， 函数的调用 
  */
    NSLog(@"%d",sum(3, 5));
    
    
    /** 
     * 函数指针：指针指向一块内存，里面是一段代码
     *
     */
     /** 定义一个函数指针变量 */
    int (*p)(int, int) = NULL;
    //函数指针变量赋值
    p = sum;
    p = sub;
    
    //通过函数指针调用函数
    p(3,5);
    
    NSLog(@"p %d",p(3,5));
    
    
    
}
#pragma mark - block
- (void)studyBlock {
/**
 * 1. Block 和函数指针很相似。技巧： *p 换成 ^block
 * 2. Block 相当匿名函数，所以block变量赋值时直接附函数的实现部分
 * 3. Block
 */

    int (^block1)(int, int) = ^int (int x, int y) {
     return x +y ;
    };

    //调用block1
    block1 (3,5);
    NSLog(@"%d",block1(1,5));
    
    
    //block 语法；
    //无参无反
    void (^block2)(void) = ^(void){
        NSLog(@"无参无反");
    };
    
    block2();
    
    //无参有反block
    NSString *(^block3)(void) = ^NSString *(void){
    return @"ddd";

};
    
    //有参无返
    void (^block4)(NSString *, NSString *) = ^(NSString *str1, NSString *str2) {
        NSLog(@"%@",[str1 stringByAppendingString:str2]);
    
    
    };
    
    block4(@"da",@"lian");
    
    //有参有返
    NSString* (^block5)(NSString *, NSString *) = ^NSString * (NSString *str1, NSString *str2) {
    
        return [str1 stringByAppendingString:str2];
    
    };
    
    NSLog(@"%@",block5(@"www",@"qqq"));
    
    
    self.block = ^(NSString *str) {
    
        NSLog(@"%@",str);
    
    };
    
    
}
- (IBAction)handleBlock:(id)sender {
    self.block(@"aaa");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
