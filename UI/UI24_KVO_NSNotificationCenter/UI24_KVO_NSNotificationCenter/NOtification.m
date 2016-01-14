//
//  NOtification.m
//  UI24_KVO_NSNotificationCenter
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "NOtification.h"

@interface NOtification ()
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UITextField *text_Message;

@end

@implementation NOtification

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.sendBtn.layer.cornerRadius = 10;
    [self NofiCenter];
}

#pragma mark - 通知中心(存在)
- (void)NofiCenter {
//获取通知中心对象
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNofi:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        //更改self，view的frame
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
    


}
- (void)handleNofi:(NSNotification *)nofi {

    NSLog(@"%@",nofi);
    CGFloat height = [[nofi.userInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue].size.height;
    //self.view 发生变化
    self.view.frame = CGRectMake(0, -height, self.view.frame.size.width, self.view.frame.size.height);
    
    
    
    //self。view的frame发生改变
   
    
    
    
}
//

- (IBAction)sendHandle:(id)sender {
    [self.view endEditing:YES];
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
