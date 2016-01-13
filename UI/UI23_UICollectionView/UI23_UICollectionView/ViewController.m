//
//  ViewController.m
//  UI23_UICollectionView
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellForList.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, retain) UICollectionView *collection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createCollectionView];
    
}

#pragma mark - 知识点1 UICollectionViewFlowLayout
//父类是UICollectionViewLayout 负责布局
- (void)createFlowLayout {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];

    //简单布局API
    //item size
    self.flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 80)/3, (self.view.frame.size.width - 80)/3.0 *1.618);
    //item 之间最小间距（横向）
    self.flowLayout.minimumInteritemSpacing = 20;
    //纵向
    self.flowLayout.minimumLineSpacing = 20;
    
    //滑动方向
    //self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
   //分区边缘距离
    self.flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //设置分区的头部和尾部的视图大小
    self.flowLayout.headerReferenceSize = CGSizeMake(50, 100);
    //设置分区的尾部大小
    self.flowLayout.footerReferenceSize = CGSizeMake(50, 100);

}
#pragma mark - 知识点2 UICollectionView

- (void)createCollectionView {
    [self createFlowLayout];
    self.collection = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayout];
    [self.view addSubview:self.collection];
    self.collection.backgroundColor = [UIColor whiteColor];
    //delegate
    self.collection.dataSource =self;
    self.collection.delegate = self;
    
    self.collection.showsVerticalScrollIndicator = NO;
//    //注册collectionView 只支持先注册，再取出
//    [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"pool1"];
    
    [self.collection registerClass:[CellForList class] forCellWithReuseIdentifier:@"pool1"];
    
    
    //collectionView 的分区头部尾部试图采用重用池机制
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"poolForHeader"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"poolForFooter"];
    [self addLongPressGesture];
}

#pragma mark - collection DataSource
//两个必须实现的协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {


    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CellForList *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool1" forIndexPath:indexPath];
    item.backgroundColor = [UIColor grayColor];

    return item;
}

/*** 返回每个分区的区头和尾部的重用视图 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"poolForHeader" forIndexPath:indexPath];
        header.backgroundColor = [UIColor redColor];
        return header;
    }else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"poolForFooter" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor greenColor];
        return footer;
    }
    

}



#pragma mark - collection Delegate
/** 选中item之后，调用此方法 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%ld,%ld",indexPath.section,indexPath.item);

}
#pragma mark - 知识点3 collect的item移动
/** collectionView 上面加上长安手势*/
- (void)addLongPressGesture {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(HandleLongPress:)];
  
    [self.collection addGestureRecognizer:longPress];
}

- (void)HandleLongPress:(UILongPressGestureRecognizer *)longPress {
//根据长安手势的状态，调用item的移动方法
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
        {    //手势所在view上的点
           
           //根据手势在view上的点，找到对应item的indexpath
        NSIndexPath *beginPath = [self.collection indexPathForItemAtPoint:[longPress locationInView:self.collection]];
            
            //如果没有点中item，直接退出
            if (beginPath == nil) {
                return;
            }
            [self.collection  beginInteractiveMovementForItemAtIndexPath:beginPath];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            //随着手势移动，item位置不断更新
            [self.collection updateInteractiveMovementTargetPosition:[longPress locationInView:self.collection]];
            
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
         //手势结束，item移动结束
            [self.collection endInteractiveMovement];
            
            
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
