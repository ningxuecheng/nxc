//
//  ToolItem.m
//  Project_A
//
//  Created by dllo on 16/1/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ToolItem.h"
#import "ViewOfTool.h"

@interface ToolItem () <ViewOfToolDelegate>

@end
@implementation ToolItem
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createViews];
        
    }
    return self;
}

- (void)createViews {
    ViewOfTool *viewOfWhether = [[ViewOfTool alloc] initWithFrame:CGRectMake(50, 10, ([UIScreen mainScreen].bounds.size.width - 100 - 10)/2, 150) Title:@"天气" Img:@"iconfont-qing"];
    [self.contentView addSubview:viewOfWhether];
    viewOfWhether.delegate = self;
    
    [viewOfWhether release];
    
    
    ViewOfTool *viewOfMap = [[ViewOfTool alloc] initWithFrame:CGRectMake(50 +([UIScreen mainScreen].bounds.size.width - 100 - 10)/2 + 10, 10, ([UIScreen mainScreen].bounds.size.width - 100)/2, 150) Title:@"地图" Img:@"iconfont-ditu"];
    viewOfMap.delegate = self;
    
    [self.contentView addSubview:viewOfMap];
    [viewOfMap release];
    
//    ViewOfTool *viewOfPhone = [[ViewOfTool alloc] initWithFrame:CGRectMake(50 +([UIScreen mainScreen].bounds.size.width - 100 - 10)/2 + 10, 130, ([UIScreen mainScreen].bounds.size.width - 100)/2, 150) Title:@"地图" Img:@"iconfont-ditu"];
//    [self.contentView addSubview:viewOfPhone];
//    [viewOfPhone release];
//    
//    ViewOfTool *viewOfMoney = [[ViewOfTool alloc] initWithFrame:CGRectMake(50 +([UIScreen mainScreen].bounds.size.width - 100 - 10)/2 + 10, 160, ([UIScreen mainScreen].bounds.size.width - 100)/2, 130) Title:@"地图" Img:@"iconfont-ditu"];
//    [self.contentView addSubview:viewOfMoney];
//    [viewOfMoney release];
    
    
    
    
}


- (void)DidPushWedMap:(NSString *)str {
    [self.delegate DidPushWed:str];

}



@end
