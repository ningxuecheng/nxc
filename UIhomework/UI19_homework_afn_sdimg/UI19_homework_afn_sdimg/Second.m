//
//  Second.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Second.h"
#import "AFNetworking/AFURLSessionManager.h"
#import "Model.h"
#import "DataBaseHandler.h"
@interface Second () <UIWebViewDelegate>
@property (nonatomic, retain) UIWebView *protWebView;
@property (nonatomic, retain) NSMutableArray *arrData;
@property (nonatomic, assign) BOOL btnIs;
@end
@implementation Second
- (void)viewWillAppear:(BOOL)animated {
    [self buttonIs];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.protWebView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.protWebView];
    NSURL *url = [[NSURL alloc] initWithString:self.url];
      [self.protWebView loadRequest:[NSURLRequest requestWithURL:url]];
}
- (void)handleAction:(UIBarButtonItem *)barbutton {
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrData.plist"];
    self.arrData = [NSMutableArray arrayWithContentsOfFile:file];
    //要归档的model对象（！！！要归档的model类一定要实现NSCoding两个协议方法）
    Model *mod = [[Model alloc] init];
    mod.title = self.title;
    mod.digest = self.digest;
    mod.imgsrc = self.imgsrc;
    mod.url = self.url;
    //创建归档时所需的Data对象
    NSMutableData *data = [NSMutableData data];
    //归档类
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //开始归档
    [archiver encodeObject:mod forKey:@"model"];
    //归档结束
    [archiver finishEncoding];
    //把model存入数组中
    [self.arrData addObject:data];
    [self.arrData writeToFile:file atomically:YES];
    UIBarButtonItem *itemDEL = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(DelAction:)];
    self.navigationItem.rightBarButtonItem = itemDEL;
    
    [self sqlMark:mod];
    
}
- (void)DelAction:(UIBarButtonItem *)btn {
    
    //数据库 移除
    [self sqlDEL:self.title];
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrData.plist"];
    NSMutableArray *array  = [NSMutableArray arrayWithContentsOfFile:file];
    NSData *temp = [NSData data];
    for (NSData *data in array) {
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        //开始反归档
        Model *model = [unarchiver decodeObjectForKey:@"model"];
        [unarchiver finishDecoding];
        if ([self.url isEqualToString:model.url]) {
            temp = data;
        }
    }
    //temp为data ，array为nsdata，移除
      [array removeObject:temp];
    NSMutableArray *arrNew = [NSMutableArray arrayWithArray:array];
    [arrNew writeToFile:file atomically:YES];
    UIBarButtonItem *itemR = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"2"] style:UIBarButtonItemStylePlain target:self action:@selector(handleAction:)];
    self.navigationItem.rightBarButtonItem = itemR;
}
- (void)buttonIs {
     NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrData.plist"];
    NSMutableArray *array  = [NSMutableArray arrayWithContentsOfFile:file];
    self.btnIs = YES;
    for (NSData *data in array) {
         NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        //开始反归档
        Model *model = [unarchiver decodeObjectForKey:@"model"];
        [unarchiver finishDecoding];
        NSLog(@"%@",model.url);
        if ([self.url isEqualToString:model.url]) {
            self.btnIs = NO; //有相等收藏
            UIBarButtonItem *itemDEL = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(DelAction:)];
            self.navigationItem.rightBarButtonItem = itemDEL;
        }
    }
    //没有相等收藏
    if (self.btnIs == YES) {
        UIBarButtonItem *itemR = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"2"] style:UIBarButtonItemStylePlain target:self action:@selector(handleAction:)];
        self.navigationItem.rightBarButtonItem = itemR;
    }




}


#pragma mark - 数据库收藏 
- (void)sqlMark:(Model *)mod {
    DataBaseHandler *database = [DataBaseHandler shareDataBaseHandler];
    [database insertMark:mod];

}

- (void)sqlDEL:(NSString *)title {
    DataBaseHandler *database = [DataBaseHandler shareDataBaseHandler];
    [database deleteWithTitle:title];

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
