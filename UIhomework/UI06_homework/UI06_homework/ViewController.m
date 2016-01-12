//
//  ViewController.m
//  UI06_homework
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) float r;
@property (nonatomic, assign) float g;
@property (nonatomic, assign) float b;
@property (nonatomic, assign) float p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSlider];
    //[self changeColor];
    
}

- (void)createSlider {
    UISlider *sliderRed = [[UISlider alloc] initWithFrame:CGRectMake(50,50, self.view.frame.size.width - 100, 20)];
    sliderRed.minimumTrackTintColor = [UIColor redColor];
    sliderRed.minimumValue = 0;
    sliderRed.maximumValue = 1;
    [sliderRed addTarget:self action:@selector(redAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderRed];
    [sliderRed release];
    
    UISlider *sliderG = [[UISlider alloc] initWithFrame:CGRectMake(50,80, self.view.frame.size.width - 100, 20)];
    sliderG.minimumTrackTintColor = [UIColor greenColor];
    sliderG.minimumValue = 0;
    sliderG.maximumValue = 1;
    [sliderG addTarget:self action:@selector(GAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderG];
    [sliderG release];
    
    UISlider *sliderB = [[UISlider alloc] initWithFrame:CGRectMake(50,110, self.view.frame.size.width - 100, 20)];
    sliderB.minimumTrackTintColor = [UIColor blueColor];
    sliderB.minimumValue = 0;
    sliderB.maximumValue = 1;
    [sliderB addTarget:self action:@selector(BAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderB];
    [sliderB release];
    
    UISlider *sliderP = [[UISlider alloc] initWithFrame:CGRectMake(50,140, self.view.frame.size.width - 100, 20)];
    sliderP.minimumTrackTintColor = [UIColor whiteColor];
    sliderP.minimumValue = 0;
    sliderP.maximumValue = 1;
    [sliderP addTarget:self action:@selector(PAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderP];
    [sliderP release];



    
    
}



- (void)redAction:(UISlider *)slider {
    NSLog(@"%f",slider.value);
    self.r = slider.value;
    
    self.view.backgroundColor = [UIColor colorWithRed:self.r green:self.g blue:self.b alpha:self.p];

}


- (void)BAction:(UISlider *)slider {
    NSLog(@"%f",slider.value);
   self.b = slider.value;
    self.view.backgroundColor = [UIColor colorWithRed:self.r green:self.g blue:self.b alpha:self.p];
    
}

- (void)GAction:(UISlider *)slider {
    NSLog(@"%f",slider.value);
    self.g = slider.value;
    self.view.backgroundColor = [UIColor colorWithRed:self.r green:self.g blue:self.b alpha:self.p];
    
}

- (void)PAction:(UISlider *)slider {
    NSLog(@"%f",slider.value);
    self.p = slider.value;
    self.view.backgroundColor = [UIColor colorWithRed:self.r green:self.g blue:self.b alpha:self.p];
    
}

- (void)changeColor {

    self.view.backgroundColor = [UIColor colorWithRed:self.r green:self.g blue:self.b alpha:1];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
