//
//  CellForMenu.m
//  UI24_KVO_NSNotificationCenter
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellForMenu.h"

@interface CellForMenu ()
@property (weak, nonatomic) IBOutlet UILabel *label_name;
@property (weak, nonatomic) IBOutlet UIButton *btnForDel;

@end

@implementation CellForMenu

- (void)awakeFromNib {
   
    //圆角
    self.label_name.backgroundColor = [UIColor redColor];
    self.label_name.layer.cornerRadius = 5;
    self.label_name.layer.masksToBounds = YES;
    
    //删除按键隐藏
    self.btnForDel.hidden = YES;
    
    //注册一个通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDel:) name:@"DELETE" object:nil];
    
    
    
}
- (IBAction)delButton:(UIButton *)sender {
    NSLog(@"qweeeeee");
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"remove" object:nil userInfo:@{@"index":self.label_name.text}];
    
}

- (void)handleDel:(NSNotification *)not {

    //显示button
    self.btnForDel.hidden = NO;
    
    
    
    

}


@end
