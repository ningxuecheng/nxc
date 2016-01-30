//
//  InfoItem.m
//  Project_A
//
//  Created by dllo on 16/1/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "InfoItem.h"
#import "ModelOfInfo.h"
#import "CellOfInfo.h"
#import "VCTravels.h"
#import <AFNetworking/AFURLSessionManager.h>

#define WIDTH self.contentView.frame.size.width
@interface InfoItem () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collCountry;
@property (nonatomic, retain) NSMutableDictionary *dicCountry;
@property (nonatomic, retain) NSMutableArray *arrKeys;

@property (nonatomic, retain) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, assign) BOOL reload;


@end

@implementation InfoItem
- (void)dealloc {
    [_collCountry release];
    [_dicCountry release];
    [_arrKeys release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createCollectionView];
        
    }
    return self;

}
#pragma mark - handleDATA
- (void)passURL:(NSString *)strURL {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.dicCountry = [NSMutableDictionary dictionary];
            for (NSDictionary *dic in responseObject) {
                NSArray *array = [dic objectForKey:@"destinations"];
                NSString *key = [dic objectForKey:@"category"];
                NSMutableArray *arrCoun = [NSMutableArray array];
                for (NSDictionary *coun in array) {
                    ModelOfInfo *model = [[ModelOfInfo alloc] init];
                    [model setValuesForKeysWithDictionary:coun];
                    [arrCoun addObject:model];
                     [model release];
                }
                [self.dicCountry setObject:arrCoun forKey:key];
               
            }
            self.arrKeys = [NSMutableArray array];
            self.arrKeys = [self.dicCountry allKeys].mutableCopy;
            [self.collCountry reloadData];
            NSLog(@"reload:%d",self.reload);
            self.reload = YES;
        }
        
        
    }];
    [dataTask resume];
}
#pragma mark - coll
- (void)createCollectionView {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout.itemSize = CGSizeMake((WIDTH - 70)/2, 180);
    self.flowLayout.minimumInteritemSpacing = 10;
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    
    self.collCountry = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height - 160) collectionViewLayout:self.flowLayout];
    self.collCountry.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.collCountry];
    self.collCountry.delegate =self;
    self.collCountry.dataSource = self;
    [self.collCountry registerClass:[CellOfInfo class] forCellWithReuseIdentifier:@"collCountry"];
    [_collCountry release];
    [_flowLayout release];
    
    


}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellOfInfo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCountry" forIndexPath:indexPath];
    if (self.reload == YES) {
        
        NSString *key = [self.arrKeys objectAtIndex:indexPath.section];
        NSArray *arr = [self.dicCountry objectForKey:key];
        ModelOfInfo *model = [arr objectAtIndex:indexPath.row];
       
       [cell passModel:model];
       
   }
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *arr = [NSArray array];
     arr = [self.dicCountry objectForKey:[self.arrKeys objectAtIndex:section]];
   
    return arr.count;

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.arrKeys.count;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    if (self.reload == YES) {
        NSString *key = [self.arrKeys objectAtIndex:indexPath.section];
        NSArray *arr = [self.dicCountry objectForKey:key];
        ModelOfInfo *model = [arr objectAtIndex:indexPath.row];
        [self.delegate DidSelectedItemPushVC:model.id];
    }

}

@end
