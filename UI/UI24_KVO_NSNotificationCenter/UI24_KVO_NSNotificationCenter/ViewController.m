//
//  ViewController.m
//  UI24_KVO_NSNotificationCenter
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellForMenu.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collect;
@property (nonatomic, retain) UIView *viewRedLine;
@property (nonatomic, retain) UIButton *btnOfView;
@property (nonatomic, retain) UIView *addview;
@property (nonatomic, retain) UICollectionView *colView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) UIButton *btnOfComplete;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRedLine];
    [self createCollectionView];
    [self createKVOAction];
    [self createButton];
    [self handleData];
    
}
#pragma mark - 长安手势
- (void)addLongPress {

    UILongPressGestureRecognizer *longRec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.colView addGestureRecognizer:longRec];

    
}
- (void)handleLongPress:(UILongPressGestureRecognizer *)longPress {
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
        { //通知中心
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DELETE" object:nil userInfo:nil];
           //根据手势在view上的点，找到对应item的indexpath
            NSIndexPath *beginPath = [self.colView indexPathForItemAtPoint:[longPress locationInView:self.colView]];
            //如果没有点钟item直接退出
            if (beginPath == nil) {
                return;
            }
            [self.colView beginInteractiveMovementForItemAtIndexPath:beginPath];
            
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            [self.colView updateInteractiveMovementTargetPosition:[longPress locationInView:self.colView]];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            [self.colView endInteractiveMovement];
            break;
        }
        default:
            break;
    }


}
/** item 移动*/
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}
/** 移动item调用此方法*/
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //更新数据源
    
}
#pragma mark - handleData
- (void)handleData {
    self.array = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@0].mutableCopy;



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
    self.collect.pagingEnabled = NO;
    [self.collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"pool1"];
   
   
}

- (void)createButton {
    self.btnOfView = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btnOfView.frame = CGRectMake(WIDTH - 40, 20, 40, 30);
    [self.view addSubview:self.btnOfView];
    [self.btnOfView setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [self.btnOfView addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)handleAction:(UIButton *)button {
    [self createKVOForColView];
    button.selected = !button.selected;
    if (button.selected) {
        if (self.colView == nil) {
            //弹出一个collectionView
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
            layout.itemSize = CGSizeMake(60, 40);
            self.colView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, HEIGHT) collectionViewLayout:layout];
            [self.view addSubview:self.colView];
            self.colView.backgroundColor = [UIColor whiteColor];
            self.colView.delegate =self;
            self.colView.dataSource = self;
            //regs
            [self addLongPress];
            [self.colView registerNib:[UINib nibWithNibName:@"CellForMenu"  bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"pool2"];
            //动画展开
        }
        [UIView animateWithDuration:0.5 animations:^{
            self.colView.frame = CGRectMake(0, 50, WIDTH, HEIGHT - 50);
            button.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }
    else {
    [UIView animateWithDuration:0.5 animations:^{
        self.colView.frame = CGRectMake(0, 50, WIDTH, 0);
        button.transform = CGAffineTransformMakeRotation(0);
    }];
    }
}
#pragma mark - collect DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.collect) {
        return 5;
    }else {
     return self.array.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.collect) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1];
         return cell;
    }else {
        CellForMenu *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool2" forIndexPath:indexPath];
        
        return cell;
    }
    

}
#pragma mark - collect Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld,%ld",indexPath.section,indexPath.item);
    
}

#pragma mark - 知识点1 KVO(键值观察者)
/** 核心：观察者 观察 某一个对象的属性变化 */
- (void)createKVOAction {
//VC观察collection的contentOffset属性
    [self.collect addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:@"context"];

}
/** 当着被观察者属性发生变化的时候，调用此方法 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        NSLog(@"%@",change);
        CGFloat x = [[change objectForKey:@"new"] CGPointValue].x;
        NSLog(@"%f",x);
        CGFloat redX = x / 5;
        //修改redline位置
        self.viewRedLine.transform = CGAffineTransformMakeTranslation(redX, 0);
    } else {
        [self.array removeObjectAtIndex:0];
        [self.colView reloadData];
    }
}

- (void)createKVOForColView {
   [[NSNotificationCenter defaultCenter] addObserverForName:@"remove" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
       [self.array removeObjectAtIndex:0];
       [self.colView reloadData];
}];
    
}




#pragma mark - 知识点2 通知中心
/** 详见另外两个VC */






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
