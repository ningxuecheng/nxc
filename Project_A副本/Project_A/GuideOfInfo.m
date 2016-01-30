//
//  GuideOfInfo.m
//  Project_A
//
//  Created by dllo on 16/1/28.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "GuideOfInfo.h"
#import "ModelOfGuInfo.h"
#import "ViewOfGuidInfo.h"
@interface GuideOfInfo ()
@property (nonatomic, retain) NSMutableArray *arrGuidInfo;
@end

@implementation GuideOfInfo
- (void)dealloc {
    [_arrGuidInfo release];
    [_arrPass release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
//    for (GuideOfInfo *model in self.arrGuidInfo) {
//        ViewOfGuidInfo *viewLine = [ViewOfGuidInfo alloc] initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 50) Title:<#(NSString *)#>
//        
//        
//    }
    for (int i = 0; i < self.arrGuidInfo.count;i++ ) {
        GuideOfInfo *model = [self.arrGuidInfo objectAtIndex:i];
        ViewOfGuidInfo *viewLine = [[ViewOfGuidInfo alloc] initWithFrame:CGRectMake(0, 70 *(i + 1), [UIScreen mainScreen].bounds.size.width, 50) Title:model.title];
        [self.view addSubview:viewLine];
        NSLog(@"i%d",i);
        [viewLine release];
        
    }
    
}

#pragma mark - handleData

- (void)handleData {
    self.arrGuidInfo = [NSMutableArray array];
    for (NSDictionary *dic in self.arrPass) {
        ModelOfGuInfo *modelInfo = [[ModelOfGuInfo alloc] initWithArr];
        [modelInfo setValuesForKeysWithDictionary:dic];
        [self.arrGuidInfo addObject:modelInfo];
        [modelInfo release];
    }
}

- (void)createViewOfLines {



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
