//
//  CellOfContact.h
//  UI_Contacts_Model
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contacts;
@interface CellOfContact : UITableViewCell
@property (nonatomic, retain) Contacts *con;

- (void)passModel:(Contacts *)con;
@end
