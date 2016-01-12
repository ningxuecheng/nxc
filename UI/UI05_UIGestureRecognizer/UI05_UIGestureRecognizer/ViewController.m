//
//  ViewController.m
//  UI05_UIGestureRecognizer
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#define WHITE [UIColor whiteColor]
@interface ViewController ()

@property (nonatomic, retain)UIImageView *imageView;

@property (nonatomic, assign)BOOL isBig;
@end


@implementation ViewController

- (void)dealloc {

    [_imageView release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = WHITE;
    [self creatimageView];
    [self tap];
    [self longPress];
    [self swip];
    [self screenEdge];
    [self pan];
    //[self pin];
    [self rotation];
}


- (void)creatimageView {

    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    
    self.imageView.frame = CGRectMake(0, 0, 200, 300);
    self.imageView.center = self.view.center;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    [_imageView release];



}

#pragma mark - 知识点1 UIGestureRecognizer 类
/**
   UIGestureRecognizer 手势识别器类
   他是抽象类 不能直接创建对象,是用他的子类创建对象
   7个子类
   1. initWithTaeget:action: 创建对象
   2. 设置响应的参数
   3. 讲手势添加到视图上
   4. 实现action方法
 */

#pragma mark - 知识点2 轻拍
- (void)tap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    
    /** 2.API (设置参数)*/
    tap.numberOfTapsRequired = 2;
    /** 3.添加到视图上 */
    [self.imageView addGestureRecognizer:tap];
    [tap release];
    
}
/** 4.实现action方法 */
- (void)tapAction:(UITapGestureRecognizer *)tap {

    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    if (self.isBig) {
        
      
            
            [UIView animateWithDuration:0.25 animations:^{
                
                //            self.imageView.frame = CGRectMake(0, 0, 200, 300);
                //            self.imageView.center = self.view.center;
                //            tap.view.transform = CGAffineTransformScale(tap.view.transform, 1.5, 1.5);
                tap.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
            }];
        
      
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            
            self.imageView.frame = CGRectMake(0, 0, 400, 600);
            self.imageView.center = self.view.center;
            
            
        }];
    
    }
    /** 状态去反 */
    self.isBig = !self.isBig;

}

#pragma mark - 知识点3 长按

- (void)longPress {

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressAction:)];
    [self.imageView addGestureRecognizer:longPress];
    [longPress release];


}

- (void)pressAction:(UILongPressGestureRecognizer *)press {
    
    if (press.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"chang");
    }
    

}

#pragma mark - 知识点4 轻扫

- (void)swip {

/** */
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    
    
    [self.view addGestureRecognizer:swip];
    [swip release];
    
  

    
    /**清扫方向*/
    swip.direction = UISwipeGestureRecognizerDirectionRight;
   //UISwipeGestureRecognizerDirectionLeft;
    
}

/** 华东之后,self.view向右移动*/
- (void)swipAction:(UISwipeGestureRecognizer *)swip {

    NSLog(@"da");
    if (self.view.frame.origin.x == 0) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.view.frame = CGRectMake(100, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
        swip.direction = UISwipeGestureRecognizerDirectionLeft;
    } else {
    
    
               [UIView animateWithDuration:0.25 animations:^{
            
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                   
        }];
        swip.direction = UISwipeGestureRecognizerDirectionRight;
    }
    
}
#pragma mark - 知识点5 屏幕边缘拖动

- (void)screenEdge {
    UIScreenEdgePanGestureRecognizer *screen = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgeAction:)];
    
    [self.view addGestureRecognizer:screen];
    [screen release];
    /**屏幕边缘方向*/
    screen.edges =  UIRectEdgeRight;
}

- (void)screenEdgeAction:(UIScreenEdgePanGestureRecognizer *)screenEdge {


    NSLog(@"%s",__FUNCTION__);



}

#pragma mark - UIView 一个重要属性: transform

/** UIView的transform属性, 
    类型: CGAffineTransform
    主要实现: 移动 缩放 旋转
 
    CGAffineTransform 仿射(几何),系统提供了方便的API,进行仿射的计算
 */

#pragma mark - 知识点6 拖动

- (void)pan {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView addGestureRecognizer:pan];
    [pan release];
  

}
- (void)panAction:(UIPanGestureRecognizer *)pan {
/** 更改 self.image.transform属性 */

    CGPoint point = [pan translationInView:pan.view];
    
    NSLog(@"%@",NSStringFromCGPoint(point));
   pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, point.y);
    
    /** 参考点归零 */
    [pan setTranslation:CGPointZero inView:pan.view];

}


#pragma mark - 知识点7 捏合(缩放)

- (void)pin {
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.imageView addGestureRecognizer:pinch];
    [pinch release];


}

- (void)pinchAction:(UIPinchGestureRecognizer *)pinch {

    NSLog(@"%f",pinch.scale);
    
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    
    pinch.scale = 1;

}

#pragma mark - 知识点8 旋转

- (void)rotation {
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [self.imageView addGestureRecognizer:rotation];
    
    [rotation release];


}

- (void)rotationAction:(UIRotationGestureRecognizer *)rotation {
    
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    rotation.rotation = 0;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
