//
//  Mother.m
//  OC09-代理设计模式
//
//  Created by dllo on 15/12/11.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Mother.h"

@implementation Mother

- (void)payMoney {
 /** 让代理人执行方法 */
    [self.delegate takecareChild];
    [self.delegate cooking];
    
    
    
    /** 判断代理人是否实现了方法 
     *  通常协议方法是@optional修饰的, 都需要用此方法进行判断.
     */
    if ([self.delegate respondsToSelector:@selector(washing)]) {
        [self.delegate washing];
        
    }
    
    
    
}


@end
