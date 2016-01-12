//
//  ViewController.m
//  UI16_homeworkIB
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Contacts.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    
}
- (void)handleData {
    self.array = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    for (NSString *key in dic) {
        
        /** 取出数组 例：A[]数组*/
        NSMutableArray *array = [dic objectForKey:key];
        /** 便利数组取出字典*/
        for (NSDictionary *condic in array) {
            Contacts *con = [[Contacts alloc] init];
            [con setValuesForKeysWithDictionary:condic];
            [self.array addObject:con];
            [con release];
        }
    }
    
    NSLog(@"%@",self.array);
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
