//
//  CellForM.h
//  UI16_homework_json_xml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Cartoon;

@interface CellForM : UITableViewCell
- (void)passModel:(Cartoon *)model;
+ (CGFloat)heightForRow:(NSString *)str;


@end
