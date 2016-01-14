//
//  ViewController.m
//  UI24_KVO_NSNotificationCenter
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collect;
@property (nonatomic, retain) UIView *viewRedLine;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRedLine];
    [self createCollectionView];
    [self createKVOAction];
    
}




#pragma mark - collectionView

- (void)createRedLine {
    self.viewRedLine = [[UIView alloc] initWithFrame:CGRectMake(0, 50,WIDTH/5, 2)];
    self.viewRedLine.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewRedLine];

}

- (void)createCollectionView {
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowlayout.itemSize = CGSizeMake(WIDTH, HEIGHT);
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowlayout.minimumLineSpacing = 0;
    
    self.collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50 + 2, WIDTH, HEIGHT) collectionViewLayout:flowlayout];
    self.collect.delegate = self;
    self.collect.dataSource = self;
    [self.view addSubview:self.collect];
    self.collect.pagingEnabled = YES;
    [self.collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"pool1"];
   
   
}

#pragma mark - collect DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool1" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1];
    
    return cell;

}

#pragma mark - collect Delegate

#pragma mark - 知识点1 KVO(键值观察者)
/** 核心：观察者 观察 某一个对象的属性变化 */
- (void)createKVOAction {
//VC观察collection的contentOffset属性

    [self.collect addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:@"context"];

}
/** 当着被观察者属性发生变化的时候，调用此方法 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"%@",change);
    CGFloat x = [[change objectForKey:@"new"] CGPointValue].x;
    NSLog(@"%f",x);
    
    CGFloat redX = x / 5;
    
    //修改redline位置
    self.viewRedLine.transform = CGAffineTransformMakeTranslation(redX, 0);
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
