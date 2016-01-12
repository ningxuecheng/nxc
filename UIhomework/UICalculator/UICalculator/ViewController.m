//
//  ViewController.m
//  UICalculator
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableString *strNumOne;
@property (nonatomic, retain) NSMutableString *strNumTwo;
@property (nonatomic, retain) NSMutableString *single;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    UILabel *txtlabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 72, 200, 50)];
    txtlabel.backgroundColor = [UIColor whiteColor];
    txtlabel.tag = 666;
    [self.view addSubview:txtlabel];
    
    [self buttonFun];
    
}

- (void)dealloc {
    [_single release];
    [_strNumOne release];
    [_strNumTwo release];
   
    [super dealloc];

}

- (void)buttonFun {
    NSArray *arr = [NSArray arrayWithObjects:@"C",@"%",@"X",@"<-",@"7",@"8",@"9",@"-",
                    @"4",@"5",@"6",@"+",@"1",@"2",@"3",@"()",@"0",@".",@"+/-",@"=", nil];
    for (int i = 0; i < 4; i++) {
        for (int j = 0 ; j < 5; j++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.backgroundColor = [UIColor whiteColor];
            btn.frame = CGRectMake(50 * (i+2), 50 * (j+3), 40, 40);
            
            [btn setTitle:arr[i+(j * 4)] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnAction:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            
            btn.tag = (i +1) + (j * 4);
            [self.view addSubview:btn];
            
        }
    }
}

- (void)btnAction:(UIButton *)button {
    
    NSLog(@"%ld",button.tag);
    UILabel *label_show = [self.view viewWithTag:666];
    if (self.strNumOne == nil &&self.strNumTwo == nil) {
        self.strNumTwo = [NSMutableString string];
        self.strNumOne = [NSMutableString string];
        self.single = [NSMutableString string];
    }
    if (self.strNumOne.length > 0 && (button.tag == 12||button.tag == 8||button.tag == 3||button.tag == 4)) {
        if (button.tag == 12) {
            if (label_show.text == button.titleLabel.text) {
                
            }else{
                self.strNumTwo = [NSMutableString stringWithFormat:@"%f",self.strNumOne.floatValue + self.strNumTwo.floatValue ];
                self.strNumOne = [NSMutableString string];
                [self.single appendFormat:@"%@",button.titleLabel.text];
                label_show.text = self.strNumTwo;}
        }else if (button.tag == 8){
            if (label_show.text == button.titleLabel.text) {
                
            }else{
                self.strNumTwo = [NSMutableString stringWithFormat:@"%f",self.strNumTwo.floatValue - self.strNumOne.floatValue ];
                self.strNumOne = [NSMutableString string];
                [self.single appendFormat:@"%@",button.titleLabel.text];
                label_show.text = self.strNumTwo;}
        
        }else if (button.tag == 3){
            if (label_show.text == button.titleLabel.text) {
                
            }else{
                if (self.strNumTwo.integerValue == 0) {
                    self.strNumTwo = [NSMutableString stringWithFormat:@"%@",label_show.text];
                    self.strNumOne = [NSMutableString string];
                    
                }else{
                self.strNumTwo = [NSMutableString stringWithFormat:@"%f",self.strNumTwo.floatValue * self.strNumOne.floatValue ];
                self.strNumOne = [NSMutableString string];
                [self.single appendFormat:@"%@",button.titleLabel.text];
                    label_show.text = self.strNumTwo;}}
            
        }else if (button.tag == 4){
            if (label_show.text == button.titleLabel.text) {
                
            }else{
                self.strNumTwo = [NSMutableString stringWithFormat:@"%f",self.strNumTwo.floatValue / self.strNumOne.floatValue ];
                self.strNumOne = [NSMutableString string];
                [self.single appendFormat:@"%@",button.titleLabel.text];
                label_show.text = self.strNumTwo;}
            
        }


    }else if (button.tag==13||button.tag==14||button.tag==15||button.tag==9||button.tag==10||button.tag==11||button.tag==5||button.tag==6||button.tag==7||button.tag == 17){
        
        
        [self.strNumOne appendFormat:@"%@",button.titleLabel.text];
        label_show.text = self.strNumOne;
    }
    if (button.tag == 1) {
        self.strNumTwo = [NSMutableString string];
        self.strNumOne = [NSMutableString string];
        self.single = [NSMutableString string];
        label_show.text = @"0";
        return;
    }
    if (button.tag == 20) {
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
