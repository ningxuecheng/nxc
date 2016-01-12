//
//  SecondViewController.h
//  UI09_HOMEWORK
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate <NSObject>

- (void)changeValue:(UITextField *) text;

@end


@interface SecondViewController : UIViewController
@property (nonatomic, retain) NSString *str;
@property (nonatomic, assign) id<SecondViewControllerDelegate> delegate;

@end
