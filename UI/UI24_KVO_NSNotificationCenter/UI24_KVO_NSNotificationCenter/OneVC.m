//
//  OneVC.m
//  UI24_KVO_NSNotificationCenter
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "OneVC.h"

@interface OneVC ()
@property (weak, nonatomic) IBOutlet UITextField *felldName;

@end

@implementation OneVC

- (void)dealloc {
//从通知中心中移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ABC" object:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"ABC" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"DDD");
        NSLog(@"note%@",note);
        self.felldName.text = [note.userInfo objectForKey:@"content"];
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
