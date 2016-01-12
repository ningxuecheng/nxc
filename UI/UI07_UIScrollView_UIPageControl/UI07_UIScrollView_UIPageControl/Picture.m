//
//  Picture.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Picture.h"
/** 延展 */
@interface Picture () <UIScrollViewDelegate>

/** 两个控件属性 */
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) UIPageControl *page;
@property (nonatomic, retain) NSMutableArray *imageArr;

@end

@implementation Picture

- (void)dealloc {
    [_scroll release];
    [_page release];
    [_imageArr release];
    [super dealloc];

}
- (instancetype)initWithFrame:(CGRect)frame
                       images:(NSArray<NSString *> *)images { //数组里庄字符串

    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageArr = [NSMutableArray arrayWithArray:images];
        
        /** 子控件的创建 */
        [self createScroll:frame];
        [self createPageView:frame];
        
    }

    
    return self;
}

#pragma mark - UIScrollView
- (void)createScroll:(CGRect)frame {
  
    /** 创建对象 */
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    [self addSubview:self.scroll];
    [_scroll release];
    
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    
    /** 常用api*/
    
    self.scroll.contentSize = CGSizeMake(self.frame.size.width*self.imageArr.count, self.frame.size.height);
    /** scroll上添加照片imageView对象 */
    [self createImageViewWithFrame:frame];
    
    /** 开启翻页效果 */
    self.scroll.pagingEnabled = YES;
    
    /** 到边远是否有会谈效果 */
    
    self.scroll.bounces = YES;
    
    /** 指定代理人 */
    self.scroll.delegate = self;
    
    self.scroll.minimumZoomScale = 0.5;
    self.scroll.maximumZoomScale = 2;
    
    
    

}

- (void)createImageViewWithFrame:(CGRect)frame {
    for (int i = 0 ; i < self.imageArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageArr[i]]];
        imageView.frame= CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        
        [self.scroll addSubview:imageView];
        [imageView release];
    }




}

#pragma mark - UIScrollView 协议方法
/**当滑动内容视图时,调用方法*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    //NSLog(@"%f",scrollView.contentOffset.x);

}
/** 挡减速已经能够完成 调用此方法 */


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
NSLog(@"%f",scrollView.contentOffset.x);
    /** 设置pagecontrol的currentPage属性*/
//    if (scrollView.contentOffset.x == 0) {
//        self.page.currentPage = 0;
//    }else if (scrollView.contentOffset.x == 300) {
//        self.page.currentPage = 1;
//    
//    }else if (scrollView.contentOffset.x == 600) {
//    
//        self.page.currentPage = 2;
//    }
    
    self.page.currentPage = scrollView.contentOffset.x / 300;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {


    return [scrollView.subviews firstObject];
}


#pragma mark - UIPageControl 
- (void)createPageView:(CGRect)frame {
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, 40)];
    
    self.page.center = CGPointMake(frame.size.width / 2, frame.size.height - 20);
    [self addSubview:self.page];
    [_page release];
    
    self.page.backgroundColor = [UIColor redColor];
    
    /** UIPageControl */
    self.page.numberOfPages = self.imageArr.count;
    
    /**添加事件 **/
    [self.page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    


}

- (void)pageAction:(UIPageControl *)page {
/** 设置scroll的偏移量 */
    //self.scroll.contentOffset = CGPointMake(page.currentPage * 300, 0);
    
    /** 设置动画效果*/
    [self.scroll setContentOffset:CGPointMake(page.currentPage * 300, 0) animated:YES];


}










@end
