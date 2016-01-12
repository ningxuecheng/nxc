//
//  Picture.m
//  UI16_homework
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Picture.h"

@interface Picture ()<UIScrollViewDelegate>
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) UIPageControl *page;
@property (nonatomic, retain) NSMutableArray *arrImages;

@end


@implementation Picture

- (void)dealloc {
    [_scroll release];
    [_page release];
    [_arrImages release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<NSString*>*)images {

    self = [super initWithFrame:frame];
    if (self) {
        self.arrImages = [NSMutableArray arrayWithArray:images];
        //创建子控件
        [self createScrollWithFrame:frame];
        [self createpageControlView:frame];

        
    }

    return self;

}


#pragma mark - UIScrollView

- (void)createScrollWithFrame:(CGRect)frame {
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:self.scroll];
    [_scroll release];
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    
    //api
    //设置contentSize
    self.scroll.contentSize = CGSizeMake(frame.size.width * self.arrImages.count, frame.size.height);
    //scrollView上添加imageView对象
    [self createImageViewWithFrame:frame];

    //开启翻页效果
    self.scroll.pagingEnabled = YES;
    //回弹效果
    self.scroll.bounces = YES;
    //指定代理人
    self.scroll.delegate = self;
    //scrollView缩放
    //缩放比例
    self.scroll.minimumZoomScale = 0.5;
    self.scroll.maximumZoomScale = 2;
}

- (void)createImageViewWithFrame:(CGRect)frame {
    for (int i = 0; i < self.arrImages.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arrImages[i]]];
        imageView.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        [self.scroll addSubview:imageView];
        [imageView release];
    }
}

#pragma mark - UIScrollView 协议方法
//当滑动内容视图时
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    NSLog(@"%s",__FUNCTION__);
    //    NSLog(@"%f",scrollView.contentOffset.x);
}

//当减速已经完成时
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%f", scrollView.contentOffset.x);
    //pageControl的currentPage属性
    self.page.currentPage = scrollView.contentOffset.x / 300;
    
}

//返回一个要缩放的View
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView.subviews firstObject];
}

#pragma mark - UIPageControl
- (void)createpageControlView:(CGRect)frame {
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, 40)];
    self.page.center = CGPointMake(frame.size.width / 2, frame.size.height - 20);
    [self addSubview:self.page];
    [_page release];
    self.page.backgroundColor = [UIColor redColor];
    //页面数
    self.page.numberOfPages = self.arrImages.count;
    [self.page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    
}
- (void)pageAction:(UIPageControl *)page {
    //设置scrollView的偏移量
    [self.scroll setContentOffset:CGPointMake(page.currentPage * 300, 0) animated:YES];
    //self.scroll.contentOffset = CGPointMake(page.currentPage * 300, 0);
    
}
@end
