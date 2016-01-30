//
//  EssayOfTravel.m
//  Project_A
//
//  Created by dllo on 16/1/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "EssayOfTravel.h"
#import "ModelOfEssay.h"
#import "CellOfEssay.h"
#import "CellOfEssay2.h"
#import <AFNetworking/AFURLSessionManager.h>
@interface EssayOfTravel () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSMutableDictionary *dic;
@property (nonatomic, retain) NSArray *array;
@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, assign) CGFloat xHeight;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat Lheight;
@end

@implementation EssayOfTravel

- (void)dealloc {
    [_dic release];
    [_array release];
    [_strURL release];
    [super dealloc];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self createTableView];
}

#pragma mark - handleData
- (void)handleData {
    NSLog(@"%@",self.strURL);
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:self.strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            //NSLog(@"OBJECT: %@123",responseObject);
            NSArray *arrTripDays = [responseObject objectForKey:@"trip_days"];
            self.dic = [NSMutableDictionary dictionary];
            
            for (NSDictionary *dic in arrTripDays) {
                NSNumber *day = [dic objectForKey:@"day"];
                NSInteger dayInt = [day integerValue];
                NSString *date = [dic objectForKey:@"trip_date"];
                NSString *key = [NSString stringWithFormat:@"DAY%02ld  %@",dayInt,date];
                NSArray *arrNodes = [dic objectForKey:@"nodes"];
                
                NSMutableArray *array = [NSMutableArray array];
                for (NSDictionary *dicInNodes in arrNodes) {
                    NSArray *arrInNotes = [dicInNodes objectForKey:@"notes"];
                    NSString *entry_type = [dicInNodes objectForKey:@"entry_type"];
                    NSString *entry_name = [dicInNodes objectForKey:@"entry_name"];
                    NSString *attraction_type = [dicInNodes objectForKey:@"attraction_type"];
                    for (NSDictionary *dicModle in arrInNotes) {
                        ModelOfEssay *model = [[ModelOfEssay alloc] init];
                        [model setValuesForKeysWithDictionary:dicModle];
                        model.entry_name = entry_name;
                        model.entry_type = entry_type;
                        model.attraction_type = attraction_type;
                        model.description_s = [dicModle objectForKey:@"description"];
                        
                        NSDictionary *dicImg = [dicModle objectForKey:@"photo"];
                        model.url = [dicImg objectForKey:@"url"];
                        model.image_height = [dicImg objectForKey:@"image_height"];
                        model.image_width = [dicImg objectForKey:@"image_width"];
                        if (model.url || !([model.description_s isEqual:[NSNull null]]||[model.description_s isEqualToString:@""])) {
                           
                                [array addObject:model];
                                
                        }
                        
                        
                        
                        [model release];
                    }
                    
                }
//                NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"col" ascending:YES];
//                [array sortUsingDescriptors:@[sort]];
                [self.dic setObject:array forKey:key];
            }
            self.array = [[self.dic allKeys] sortedArrayUsingSelector:@selector(compare:)];
            [self.tableView reloadData];
            

        }
        
#if 1
        //NSLog(@"%@",self.array);
        for (NSString *key in self.array) {
            NSArray *arr = [self.dic objectForKey:key];
            for (ModelOfEssay *model in arr) {
                if (model.url&&![model.description_s isEqual:[NSNull null]]&&![model.description_s isEqual:@""]) {
                    //NSLog(@"url:%@",model.url);
                    NSLog(@"des:%@",model.description_s);
                } else{
                   //NSLog(@"des:%@",model.description_s);
                }
                
            }
        }
#endif
        
        
        
    }];
    [dataTask resume];


}
#pragma mark - tableView
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CellOfEssay2 class]forCellReuseIdentifier:@"CellOfEssay2"];
    [self.tableView registerClass:[CellOfEssay class] forCellReuseIdentifier:@"CellOfEssay"];
    [_tableView release];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [self.array objectAtIndex:section];
    NSArray *arr = [self.dic objectForKey:key];
    return arr.count;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [self.array objectAtIndex:section];
    return key;
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [self.array objectAtIndex:indexPath.section];
    NSArray *arr = [self.dic objectForKey:key];
    ModelOfEssay *model = [arr objectAtIndex:indexPath.row];
    if (model.url) {
        CellOfEssay *cellOfImg = [tableView dequeueReusableCellWithIdentifier:@"CellOfEssay"];
        self.width = model.image_width.floatValue;
        self.height = model.image_height.floatValue;
       
        self.xHeight = self.height * (self.view.frame.size.width - 30)/self.width;
        [cellOfImg passAnyModel:model];
        if (![model.description_s isEqual:[NSNull null]]&&![model.description_s isEqual:@""]) {
         self.Lheight = [CellOfEssay heightForLabel:model.description_s];
            
        }
        
        
        return cellOfImg;
    } else{
        CellOfEssay2 *cell = [tableView dequeueReusableCellWithIdentifier:@"CellOfEssay2"];
        [cell passModel:model];
        return cell;
    }
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [self.array objectAtIndex:indexPath.section];
    NSArray *arr = [self.dic objectForKey:key];
    ModelOfEssay *model = [arr objectAtIndex:indexPath.row];
    if (!model.url) {
        CellOfEssay2 *cell = [[CellOfEssay2 alloc] init];
        return [cell heightForCell:model]+ 10;
        
    } else {
        if (![model.description_s isEqual:[NSNull null]]&&![model.description_s isEqual:@""]) {
          
            return self.xHeight + 20 + self.Lheight;
        } else {
        
            return self.xHeight + 20;
        }
    }
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
