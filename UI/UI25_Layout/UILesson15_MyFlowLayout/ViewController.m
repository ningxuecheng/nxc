//
//  ViewController.m
//  MyFlowLayout
//
//  Created by 苗旭萌 on 15/10/9.
//  Copyright (c) 2015年 苗旭萌. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "WaterFlowLayout.h"
#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, WaterFlowDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    //    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    WaterFlowLayout *flowLayout = [[WaterFlowLayout alloc] init];
    
    flowLayout.delegate = self;
    
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
    
    flowLayout.itemSize = CGSizeMake(w, w);
    
    flowLayout.sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    flowLayout.insertItemSpacing = 10;
    
    flowLayout.numberOfColumns = 3;
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
}

- (CGFloat)heightForItemIndexPath:(NSIndexPath *)indexPath
{
    Model *model = self.dataArray[indexPath.item];
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
    
    CGFloat h = (model.height / model.width) * w;
    
    return h;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{   NSLog(@"%s",__func__);
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{   NSLog(@"%s",__func__);
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    Model *mode = self.dataArray[indexPath.item];
    cell.backgroundColor = [UIColor yellowColor];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:mode.thumbURL]];
    return cell;
}
- (void)loadData
{
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    self.dataArray = [NSMutableArray array];
    NSData *data = [NSData dataWithContentsOfFile:pathStr];
    if (data != nil) {
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dic in dataArray) {
            Model *model = [[Model alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.dataArray addObject:model];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
