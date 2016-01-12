//
//  ViewController.m
//  UI16_可视化编程_StoryBoard
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Second.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)handleAction:(id)sender {
    //跳转到下一页
    Second *sec = [[Second alloc] initWithNibName:@"Second" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:sec animated:YES];
    
    
    
    /**
      当xib的文件名和VC类的名字一样时，初始化方法可以使用init，系统会首先去找和VC类名相同的xib文件
     
     */
    
    
    
    [sec release];
    
    
    
    
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
