//
//  Model.h
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject <NSCoding>

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *digest;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *imgsrc;
@property (nonatomic, retain) NSString *docid;

@end
