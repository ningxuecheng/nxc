//
//  ViewController.m
//  UI09_代理设计模式新思考
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
@interface ViewController () <TouchViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self touchCreate];
}

- (void)touchCreate {
    TouchView *touch = [[TouchView alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100 , 100)];
    touch.backgroundColor = [UIColor orangeColor];
    touch.delegate = self;
    [self.view addSubview:touch];
    [touch release];


}

- (void)beginClick {

    NSLog(@"ddd");
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didClick {
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"qqq");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
