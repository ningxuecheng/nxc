//
//  ViewController.m
//  UI_nike_bride
//
//  Created by dllo on 15/12/19.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "DragView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Randomize" style:UIBarButtonItemStylePlain target:self action:@selector(layoutNike)];

    NSUInteger maxNikes = 12; //number of img to add
    NSArray *nikeArr = @[@"1.jpg",@"2.jpg",@"3"];
    
    //add the flowers
    for (NSInteger i = 0; i < maxNikes; i++) {
        NSString *whichNike = [nikeArr objectAtIndex:(random() % nikeArr.count)];
        DragView *nikeDragger = [[DragView alloc] initWithImage:[UIImage imageNamed:whichNike]];
        [self.view addSubview:nikeDragger];
        
    }
    [self layoutNike];
    
    
}

- (void)layoutNike {
[UIView animateWithDuration:0.3f animations:^{
    for (UIView *nikeDragger in self.view.subviews) {
        nikeDragger.center = [self randomNikePosition];
    }
}];
}

- (CGPoint)randomNikePosition {

    CGFloat halfNike = 20.0f;
    CGSize insetSize = CGRectInset(self.view.bounds, 2*halfNike, 2*halfNike).size;
    CGFloat randomX = random() % ((int)insetSize.width) + halfNike;
    CGFloat randomY = random() % ((int)insetSize.height) + halfNike;
    return CGPointMake(randomX, randomY);


}

//*1*/
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self layoutNike];

}

- (BOOL)prefersStatusBarHidden {

    return YES;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
