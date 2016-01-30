//
//  TouchView.m
//  UI29_Block
//
//  Created by dllo on 16/1/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TouchView.h"

@interface TouchView ()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, copy) void (^block)(TouchView *);
@property (nonatomic, copy) void (^deleBtnHandle)(UIButton *);
@property (nonatomic, copy) void (^editBtnHandle)(UIButton *);
@end


@implementation TouchView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"TouchView" owner:self options:nil];
        self.view.frame = self.bounds;
        [self addSubview:self.view];
    }

    return self;
}
/** 点击删除的button*/
- (IBAction)handleButtonAction:(id)sender {
    UIButton *btn = sender;
    self.deleBtnHandle(btn);
}

- (void)buttonHandle:(void(^)(UIButton * deleBtn))block {

    self.deleBtnHandle = block;
}



- (IBAction)editBtnHandle:(id)sender {
    UIButton *btn = sender;
    self.deleBtnHandle(btn);
    self.editBtnHandle(btn);
    
}
- (void)buttonHandle: (void(^)(UIButton * deleBtn))block editBtn:(void(^)(UIButton * editBtn))edit {
    self.deleBtnHandle = block;
    self.editBtnHandle = edit;

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //点击之后调用block
    self.block(self);


}

/** 实现带block参数的方法 */
- (void)viewDidClick:(void (^)(TouchView *))block {

    self.block = block;

}

@end
