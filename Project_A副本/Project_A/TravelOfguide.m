//
//  TravelOfguide.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TravelOfguide.h"
#import "ModelOfGuide.h"
#import "GuidOfItem.h"
#import "GuidOfHeader.h"
#import "GuideOfInfo.h"
#import <AFNetworking/AFURLSessionManager.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface TravelOfguide () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) NSMutableDictionary *dicObject;


@property (nonatomic, retain) UICollectionView *collect;
@property (nonatomic, retain) UICollectionViewFlowLayout *flowLayout;
@end

@implementation TravelOfguide

- (void)dealloc {
    [_collect release];
    [_strURL release];
    [_array release];
    [_dicObject release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self createCollectionView];
    
}


#pragma mark - data
- (void)handleData {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:self.strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.dicObject = [NSMutableDictionary dictionary];
            self.array = [NSMutableArray array];
            for (NSDictionary *dic in responseObject) {
                NSArray *arrPages = [dic objectForKey:@"pages"];
                NSMutableArray *arrModel = [NSMutableArray array];
                NSString *keyNum = [dic objectForKey:@"category_type"];
                for (NSDictionary *dicModel in arrPages) {
                    ModelOfGuide *model = [[ModelOfGuide alloc] initWithArr];
                    [model setValuesForKeysWithDictionary:dicModel];
                    [arrModel addObject:model];
                    [model release];
                }
                [self.dicObject setObject:arrModel forKey:keyNum];
            }
            self.array = [[self.dicObject allKeys] sortedArrayUsingSelector:@selector(compare:)].mutableCopy;
            
            [self.collect reloadData];
        }
    }];
    [dataTask resume];
    
}


#pragma mark - COLL
- (void)createCollectionView {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout.itemSize = CGSizeMake((WIDTH - 60)/2, 40);
    self.flowLayout.minimumInteritemSpacing = 10;
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //设置分区的头部和尾部的视图大小
    self.flowLayout.headerReferenceSize = CGSizeMake(10, 40);
    //设置分区的尾部大小
    self.flowLayout.footerReferenceSize = CGSizeMake(50, 2);
    
    
    self.collect = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayout];
    self.collect.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collect];
    self.collect.delegate =self;
    self.collect.dataSource = self;
    [self.collect registerClass:[GuidOfItem class] forCellWithReuseIdentifier:@"GuidOfItem"];
    
    [self.collect registerClass:[GuidOfHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GuidOfItemForHeader"];
    [self.collect registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"poolForFooter"];
    

    
    [_collect release];
    [_flowLayout release];
    
    
    
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GuidOfItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GuidOfItem" forIndexPath:indexPath];
    NSString *key = [self.array objectAtIndex:indexPath.section];
    NSArray *arr = [self.dicObject objectForKey:key];
    ModelOfGuide *model = [arr objectAtIndex:indexPath.row];
    [cell passAnyModel:model];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *arr = [NSArray array];
    arr = [self.dicObject objectForKey:[self.array objectAtIndex:section]];
    
    return arr.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.array.count;
    
}

/*** 返回每个分区的区头和尾部的重用视图 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        GuidOfHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"GuidOfItemForHeader" forIndexPath:indexPath];
        NSString *key = [self.array objectAtIndex:indexPath.section];
        
        [header passNum:key];
        
        //header.backgroundColor = [UIColor redColor];
        return header;
    }else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"poolForFooter" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor greenColor];
        return footer;
    }
    
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [self.array objectAtIndex:indexPath.section];
    NSArray *arr = [self.dicObject objectForKey:key];
    ModelOfGuide *model = [arr objectAtIndex:indexPath.row];
    
    GuideOfInfo *vc = [[GuideOfInfo alloc] init];
    vc.arrPass = model.children;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
