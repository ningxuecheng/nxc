//
//  CellView.m
//  UI08_homework
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellView.h"

@interface CellView ()
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, retain) NSMutableArray *nameArr;
@property (nonatomic, retain) NSMutableArray *telArr;
@property (nonatomic, retain) UIView *blackView;

@end
@implementation CellView

- (void)dealloc {
    [_imageView release];
    [_label_tel release];
    [_label_name release];
    [_line release];
    [_scroll release];
    [_arr release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)arr
                      namearr:(NSArray *)namearr
                       telarr:(NSArray *)telarr{

    self = [super initWithFrame:frame];
    if (self) {
        self.arr = [NSMutableArray arrayWithArray:arr];
        self.nameArr = [NSMutableArray arrayWithArray:namearr];
        self.telArr = [NSMutableArray arrayWithArray:telarr];
        [self creatScroll:frame];
        
    }



    return self;
}

- (void)createImageView:(CGRect)frame {
    
    for (int i = 0 ; i < self.arr.count; i++) {
        /** 创建一个模板 view*/
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, i*frame.size.height, frame.size.width, frame.size.height)];
        blackView.backgroundColor = [UIColor whiteColor];
        
        /** 创建一个相框 */
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arr[i]]];
        imageView.frame = CGRectMake(5, 0, frame.size.width/2, frame.size.height);
        [blackView addSubview:imageView];
        
        /** 创建一个name*/
        UILabel *label_name = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2 + 10, 10, frame.size.width/2 - 10, 40)];
        label_name.text = self.nameArr[i];
        label_name.backgroundColor = [UIColor whiteColor];
        label_name.textAlignment = 1;
        [blackView addSubview:label_name];
        
        /** 创建一个tel*/
        UILabel *label_tel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2 + 5, 60, frame.size.width/2 - 10, 40)];
        label_tel.text = self.telArr[i];
        label_tel.backgroundColor = [UIColor whiteColor];
        label_tel.textAlignment = 1;
        [blackView addSubview:label_tel];
       
        [self.scroll addSubview:blackView];
    }
    
}


- (void)creatScroll:(CGRect)frame {
    /** 创建对象 */
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    [self addSubview:self.scroll];
    [_scroll release];
    
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    
    /** 常用api*/
    
    self.scroll.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height*self.arr.count);
    /** scroll上添加照片imageView对象 */
    [self createImageView:frame];
    
    /** 开启翻页效果 */
    self.scroll.pagingEnabled = YES;
    
    /** 到边远是否有会谈效果 */
    
    self.scroll.bounces = YES;



}







@end
