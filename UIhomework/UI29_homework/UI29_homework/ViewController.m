//
//  ViewController.m
//  UI29_homework
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Second.h"
@interface ViewController () <SecondDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label_block;
@property (weak, nonatomic) IBOutlet UILabel *label_del;

@end

@implementation ViewController

- (void)passValue:(NSString *)string {
    self.label_del.text = string;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)handleNext:(id)sender {
    Second *vc2 = [[Second alloc] init];
    vc2.delegate =self;
    
    vc2.block = ^(NSString *str) {
    
        self.label_block.text =str;
    };
    
    
    [self.navigationController pushViewController:vc2 animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
