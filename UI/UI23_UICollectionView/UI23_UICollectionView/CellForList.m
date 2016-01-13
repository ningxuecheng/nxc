//
//  CellForList.m
//  UI23_UICollectionView
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellForList.h"

@implementation CellForList

-(instancetype)initWithFrame:(CGRect)frame {
     NSLog(@"%s",__FUNCTION__);
    self = [super initWithFrame:frame];
    if (self) {
        self.pic = [[UIImageView alloc] init];
        [self.contentView addSubview:self.pic];
        self.pic.backgroundColor = [UIColor redColor];
    }
    return self;
}
/** collectioncell 的子控件布局一般在此方法中设置*/
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    NSLog(@"%@",layoutAttributes);
    NSLog(@"%s",__FUNCTION__);
    self.pic.frame = self.contentView.frame;
    

}
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {

    NSLog(@"%s",__FUNCTION__);
    return layoutAttributes;

}

@end
