//
//  ViewController.m
//  UI08_homework2
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "cell.h"

@interface ViewController ()
@property (nonatomic, retain) UIScrollView *scroll;

@end

@implementation ViewController
- (void)dealloc {
    [_scroll release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createScroll];
    [self createView];
}


- (void)createScroll {
    self.scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.scroll];
    [_scroll release];
    
    self.scroll.backgroundColor = [UIColor grayColor];
    self.scroll.contentSize = CGSizeMake(self.view.frame.size.width, 100*10);
}

- (void)createView {
    for (int i = 0 ; i < 10 ; i++) {
        Cell *cell = [[Cell alloc] initWithFrame:CGRectMake(0, 100*i, self.view.frame.size.width, 90)];
        [self.scroll addSubview:cell];
        [cell release];
        cell.backgroundColor = [UIColor orangeColor];
    }



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
