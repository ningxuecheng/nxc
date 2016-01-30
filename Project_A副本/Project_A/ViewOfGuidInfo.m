//
//  ViewOfGuidInfo.m
//  Project_A
//
//  Created by dllo on 16/1/28.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewOfGuidInfo.h"

@interface ViewOfGuidInfo ()
@property (nonatomic, retain) UILabel *label_name;
@property (nonatomic, retain) UIImageView *imgView;
@end
@implementation ViewOfGuidInfo
-(void)dealloc {
    [_label_name release];
    [_imgView release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame Title :(NSString *)string {
    self = [super init];
    if (self) {
        self.label_name = [[UILabel alloc] init];
        self.label_name.text = string;
        self.label_name.frame  = CGRectMake(25, 5, frame.size.width-50-35, frame.size.height - 10);
        [self addSubview:self.label_name];
        [_label_name release];
        
        self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfont-chevron"]];
        self.imgView.frame = CGRectMake(frame.size.width - 50 , 9, 32, 32);
        [self addSubview:self.imgView];
        
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(18, 2, 2, 46)];
        [self addSubview:viewLine];
        [viewLine release];
    }

    return self;

}



@end
