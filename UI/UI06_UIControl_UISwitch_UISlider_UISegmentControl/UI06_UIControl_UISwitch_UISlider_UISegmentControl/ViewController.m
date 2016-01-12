//
//  ViewController.m
//  UI06_UIControl_UISwitch_UISlider_UISegmentControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIImageView *imageViewZombie;
@property (nonatomic, retain) UISwitch *sw;

@end

@implementation ViewController

- (void)dealloc {
    [_imageViewZombie release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createimageVeiw];
    [self creatSwitch];
    [self createSlider];
    [self createSegmentedControl];
}

- (void)createimageVeiw {
    self.imageViewZombie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Zombie0.tiff"]];
    self.imageViewZombie.frame = CGRectMake(0, 0, 300, 350);
    self.imageViewZombie.center = self.view.center;
    
    [_imageViewZombie release];
    [self.view addSubview:self.imageViewZombie];

    
    /** 动画 */
    NSMutableArray *arrAni = [NSMutableArray array];
    for (int i = 0; i < 22; i ++) {
        NSString *str = [NSString stringWithFormat:@"Zombie%d.tiff",i];
        UIImage *image = [UIImage imageNamed:str];
        [arrAni addObject:image];
    }
    self.imageViewZombie.animationImages = arrAni;
    self.imageViewZombie.animationDuration = arrAni.count * 0.1;
    self.imageViewZombie.animationRepeatCount = 0;
}

#pragma mark - 知识点1 UISwitch(开关控件)
- (void)creatSwitch {
    self.sw = [[UISwitch alloc] initWithFrame:CGRectMake(50, 50, 0, 0)];
    
    /** API*/
    self.sw.tintColor = [UIColor redColor];
    self.sw.onTintColor = [UIColor redColor];
    self.sw.thumbTintColor = [UIColor orangeColor];
    
    /** 核心事件.*/
    [self.sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.sw];
    [self.sw release];


}
- (void)switchAction:(UISwitch *)sw {
    NSLog(@"ddd");
    if (sw.on) {
        [self.imageViewZombie startAnimating];
    }else{
    
        [self.imageViewZombie stopAnimating];
    }
    

}


#pragma mark - 知识点2 UISlider(滑动条)

- (void)createSlider {
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 30)];
    /** API */
    slider.minimumValue = 1;
    slider.maximumValue = 100;
    
    slider.minimumValueImage = [UIImage imageNamed:@"1"];
    slider.maximumValueImage = [UIImage imageNamed:@"212"];
    
    /*/添加事件**/
    
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:slider];
    [slider  release];


}

- (void)sliderAction:(UISlider *)slider {

    if ([self.sw isOn]) {
        self.imageViewZombie.animationDuration = self.imageViewZombie.animationImages.count * 0.5 / slider.value;
        [self.imageViewZombie startAnimating];
        
    }
    

}

#pragma mark - 知识点3 UISegmentedControl
- (void)createSegmentedControl {
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"红",@"黄",@"蓝"]];
    segmentedControl.frame = CGRectMake(50, 600, self.view.frame.size.width - 100, 40);
    
    /**添加事件*/
    [segmentedControl addTarget:self action:@selector(Action:) forControlEvents:UIControlEventValueChanged];
    
    /**默认选中的*/
    segmentedControl.selectedSegmentIndex = 1;
    
    [self.view addSubview:segmentedControl];
    [segmentedControl release];
}

- (void)Action:(UISegmentedControl *)seg {

    switch (seg.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = [UIColor redColor];
            break;
        case 1:
            self.view.backgroundColor = [UIColor yellowColor];
            break;
        case 2:
            self.view.backgroundColor = [UIColor blueColor];
        default:
            break;
    }


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
