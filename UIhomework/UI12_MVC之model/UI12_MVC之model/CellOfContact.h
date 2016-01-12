//
//  CellOfContact.h
//  UI12_MVC之model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;
@interface CellOfContact : UITableViewCell


@property (nonatomic, retain) Contact *con;


/** 声明一个方法，传入一个model数据过来。 */
- (void)passModel:(Contact *)con;

@end
