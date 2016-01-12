//
//  ViewController.m
//  UI04HOME_DENG
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "DengView.h"
@interface ViewController () <DengViewDelegate>

@end

@implementation ViewController

- (void)changeColor:(DengView *)view {

    DengView *dengself = [self.view viewWithTag:view.tag];
    NSLog(@"%ld",dengself.tag);
    [self colorsView:dengself];
    
    DengView *dengL = [self.view viewWithTag:view.tag - 1];
    DengView *dengR = [self.view viewWithTag:view.tag + 1];
    DengView *dengP = [self.view viewWithTag:view.tag - 100];
    DengView *dengD = [self.view viewWithTag:view.tag + 100];
    [self colorsView:dengL];
    [self colorsView:dengR];
    [self colorsView:dengP];
    [self colorsView:dengD];

}

- (void)colorsView:(DengView *)deng {

    if (deng.backgroundColor == [UIColor blueColor]) {
        deng.backgroundColor = [UIColor yellowColor];
    }else {
    
        deng.backgroundColor = [UIColor blueColor];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self dengView];
}

- (void)dengView {
    for (int i = 0; i < 5; i++) {
        for (int j = 0 ; j < 5; j++) {
            
            
            DengView *dengView = [[DengView alloc] initWithFrame:CGRectMake(50 * (i + 1), 50 * (j + 1) , 40, 40)];
            dengView.backgroundColor = [UIColor blueColor];
            dengView.tag = (i + 10) + (j * 100);
            [self.view addSubview:dengView];
            dengView.delegate = self;
            [dengView release];
            
            
        }
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
