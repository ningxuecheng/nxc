//
//  ViewController.m
//  UI23_homework_UICollectionView
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "CellForList.h"
@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, retain) NSMutableArray *arrFilm;
@property (nonatomic, retain) UICollectionView *collection;
@property (nonatomic, retain) UICollectionViewFlowLayout *flowLayout;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self createCollectionView];
    
    
}

- (void)handleData {
    self.arrFilm = [NSMutableArray array];
    NSString *file = [[NSBundle mainBundle] pathForResource:@"douban_yingyuan" ofType:@"txt"];

    NSData *data = [NSData dataWithContentsOfFile:file];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *array = [result objectForKey:@"subjects"];
    
    for (NSDictionary *dic in array) {
        Model *mod = [[Model alloc] init];
        NSDictionary *pic = [dic objectForKey:@"pic"];
        [mod setValuesForKeysWithDictionary:dic];
        mod.normal = [pic objectForKey:@"normal"];
        [self.arrFilm addObject:mod];
    }
}

#pragma mark - 创建collectionview
- (void)createCollectionView {
    [self createFlowLayout];
    self.collection = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayout];
    [self.view addSubview:self.collection];
    self.collection.backgroundColor = [UIColor whiteColor];
    self.collection.delegate =self;
    self.collection.dataSource = self;
    self.collection.showsVerticalScrollIndicator = NO;
    [self.collection registerNib:[UINib nibWithNibName:@"CellForList" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"pool1"];

}
#pragma mark - 创建 UICollectionViewFlowLayout
- (void)createFlowLayout {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 80)/3, (self.view.frame.size.width - 80)/3.0 *1.818);
    self.flowLayout.minimumInteritemSpacing = 20;
    self.flowLayout.minimumLineSpacing = 20;
     self.flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);

}
#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrFilm.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CellForList *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool1" forIndexPath:indexPath];
    Model *model = [self.arrFilm objectAtIndex:indexPath.row];
    [cell passModel:model];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
