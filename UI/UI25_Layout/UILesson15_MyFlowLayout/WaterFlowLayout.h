#import <UIKit/UIKit.h>

@protocol WaterFlowDelegate <NSObject>

// 获取item高度
- (CGFloat)heightForItemIndexPath:(NSIndexPath *)indexPath;

@end


@interface WaterFlowLayout : UICollectionViewLayout
// item大小
@property (nonatomic,assign)CGSize itemSize;

// item 间距
@property (nonatomic,assign)CGFloat insertItemSpacing;


//代理
@property (nonatomic,weak)id<WaterFlowDelegate>delegate;



@end
