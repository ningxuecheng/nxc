//
//  VCTravels.m
//  Project_A
//
//  Created by dllo on 16/1/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "VCTravels.h"
#import "TravelCell.h" //travel item
#import "InfoItem.h"
#import "RaidersOfCountry.h"
#import "ViewOfTravel.h"
#import "EssayOfTravel.h"
#import "ToolItem.h"
#import "MapViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT  self.view.frame.size.height
@interface VCTravels () <UICollectionViewDataSource, UICollectionViewDelegate,InfoItemDelegate,TravelCellDelegate,ToolItemDelegate>
@property (nonatomic, retain) ViewOfTravel *label_travels;
@property (nonatomic, retain) ViewOfTravel *label_info;
@property (nonatomic, retain) ViewOfTravel *label_tools;

@property (nonatomic, retain) UICollectionView *collect;
@property (nonatomic, retain) UIView *viewRedLine;

@property (nonatomic, retain) NSArray *arrURL;

@end

@implementation VCTravels
- (void)dealloc {
    [_label_info release];
    [_label_tools release];
    [_label_travels release];
    [_collect release];
    [_viewRedLine release];
    [_arrURL release];
    [super dealloc];
}
- (void)viewWillAppear:(BOOL)animated {
   }

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleURL];
    [self changeNavigationItem];
    [self createLabelandLine];
    [self createCollectionView];
    [self createKVOAction];
}

#pragma mark - 创建导航栏
- (void)changeNavigationItem {
    
    /** 中间的标题部分. */
    
    self.navigationItem.title = @"蝉游记";
    /** 左边部分 */
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    
    /** 右边部分*/
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(tuziAction:)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStylePlain target:self action:@selector(ddAction:)];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
}
#pragma mark - 页标题
- (void)createLabelandLine {
    self.label_travels = [[ViewOfTravel alloc] initWithFrame:CGRectMake(0, 65, WIDTH/3, 40) title:@"游记"];
    self.label_travels.block = ^() {
        [self.collect setContentOffset:CGPointMake(0, 0) animated:YES];
    };
    [self.view addSubview:self.label_travels];
    [_label_travels release];
    
    
    self.label_info = [[ViewOfTravel alloc] initWithFrame:CGRectMake(WIDTH/3, 65, WIDTH/3, 40) title:@"攻略"];
    self.label_info.block = ^() {
        [self.collect setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
        };

    [self.view addSubview:self.label_info];
    [_label_info release];
    
    self.label_tools = [[ViewOfTravel alloc] initWithFrame:CGRectMake(WIDTH/3*2, 65, WIDTH/3, 40) title:@"工具箱"];
    self.label_tools.block = ^() {
      [self.collect setContentOffset:CGPointMake(WIDTH * 2, 0) animated:YES ];
    };
    [self.view addSubview:self.label_tools];
    [_label_tools release];
    
    self.viewRedLine = [[UIView alloc] initWithFrame:CGRectMake(0, 105,WIDTH/3, 2)];
    self.viewRedLine.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.viewRedLine];
    [_viewRedLine release];
    
    


}
#pragma mark - collectionView
- (void)createCollectionView {
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.itemSize = CGSizeMake(WIDTH, HEIGHT);
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowlayout.minimumLineSpacing = 0;
    self.collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 107, WIDTH, HEIGHT) collectionViewLayout:flowlayout];
    self.collect.delegate = self;
    self.collect.dataSource = self;
    [self.view addSubview:self.collect];
    self.collect.pagingEnabled = YES;
    self.collect.bounces = NO;
    [self.collect registerClass:[TravelCell class] forCellWithReuseIdentifier:@"collect1"];
    [self.collect registerClass:[InfoItem class] forCellWithReuseIdentifier:@"collect2"];
    [self.collect registerClass:[ToolItem class] forCellWithReuseIdentifier:@"ToolItem"];
    
    
    [flowlayout release];
    [_collect release];
    
}
#pragma mark - collectionViewDatasource Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return self.arrURL.count + 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 0) {
        TravelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collect1" forIndexPath:indexPath];
        cell.delegate = self;
        [cell passURL:[self.arrURL objectAtIndex:indexPath.item]];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    } else if (indexPath.item == 1) {
        InfoItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collect2" forIndexPath:indexPath];
        cell.delegate = self;
        [cell passURL:[self.arrURL objectAtIndex:indexPath.item]];
        return cell;
    } else {
        ToolItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ToolItem" forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }
  }
#pragma mark - item Delegate 
- (void)DidSelectedItemPushVC:(NSString *)strURL {
    RaidersOfCountry *vc = [[RaidersOfCountry alloc] init];
    
    NSString *url = [NSString stringWithFormat:@"http://chanyouji.com/api/destinations/%@.json",strURL];
    vc.strURL = url;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];

}
- (void)travelCellDidSelectedItemPushVC:(NSString *)strURL {

    EssayOfTravel *essayVC = [[EssayOfTravel alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://chanyouji.com/api/trips/%@.json",strURL];
    essayVC.strURL = url;
    [self.navigationController pushViewController:essayVC animated:YES];
    [essayVC release];
}
- (void)DidPushWed:(NSString *)str {

    MapViewController *vc = [[MapViewController alloc] init];
    [self.navigationController  pushViewController:vc animated:YES];
    [vc release];
    if ([str isEqualToString:@"地图"]) {
        
    }

}


#pragma mark -  KVO(键值观察者)
- (void)createKVOAction {
    //VC观察collection的contentOffset属性
    [self.collect addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:@"context"];
    
}
/** 当着被观察者属性发生变化的时候，调用此方法 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
       
        CGFloat x = [[change objectForKey:@"new"] CGPointValue].x;
       
        CGFloat redX = x / 3;
        //修改redline位置
        self.viewRedLine.transform = CGAffineTransformMakeTranslation(redX, 0);
        
        
    }
}

#pragma mark - handleURL
- (void)handleURL {

    self.arrURL = @[@"http://chanyouji.com/api/trips/featured.json?page=1",@"http://chanyouji.com/api/destinations.json"];


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
