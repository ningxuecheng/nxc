
#import "WaterFlowLayout.h"

@interface WaterFlowLayout()
// 获取item的总数量
@property (nonatomic,assign) NSUInteger numberOfItems;

// 用来保存每一列的高度
@property (nonatomic,strong) NSMutableArray *columnHeights;

//用来保存每一个item计算好的属性（x,y,w,h）
@property (nonatomic,strong) NSMutableArray *arrForAtrributes;
// 保存每个item的X值
@property (nonatomic, assign) CGFloat xForItemOrigin;
// 保存每个item的Y值
@property (nonatomic, assign) CGFloat yForItemOrigin;
// 纪录最短的列
@property (nonatomic, assign) NSInteger shortestIndex;
@end

@implementation WaterFlowLayout
#pragma mark - collectionViewLayout类方法
// 准备布局
- (void)prepareLayout {
    
    NSLog(@"%s",__func__);
    if (!_arrForAtrributes) {
        self.arrForAtrributes = [NSMutableArray array];
    }

    if (!_arrForAtrributes) {
        self.arrForAtrributes = [NSMutableArray array];
    }
    
    
    // 调用父类布局
    [super prepareLayout];
    self.columnHeights = @[@10,@10,@10].mutableCopy;
    
    
    // 获取item的数量
    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
    // 为每个item确定LayoutAttribute属性同时将这些属性放入布局数组中
    for(int i = 0;i < self.numberOfItems;i++)
    {
        // 确定每个item的origin的xy值
        [self getItemOriginPoint];
        // 确定每个item 的indexPath 属性
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        /** 确定每个item的frame属性，同时确定了每个item的LayoutAttribute，放入布局属性数组中*/
        
        [self setFrame:indexPath];
    }
}
// 计算contentView的大小
- (CGSize)collectionViewContentSize {
    NSLog(@"%s",__func__);
    // 获取最长高度索引
    NSInteger longerstIndex = [self p_indexForLongestColumn];
    // 通过索引获取高度
    CGFloat longestH = [self.columnHeights[longerstIndex] floatValue];
    // 获取collectionView的Size
    CGSize contentSize = self.collectionView.frame.size;
    // 最大高度+bottom
    contentSize.height = longestH + 10;
    return contentSize;
}
// 返回每一个item的attribute
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSLog(@"%s",__func__);
    // 返回每一个item的Attribute
    return self.arrForAtrributes;
}





#pragma mark - feature
// 获取最长列的索引
- (NSInteger)p_indexForLongestColumn
{
    // 记录那一列最长
    NSInteger longestIndex = 0;
    // 记录当前最长高度
    CGFloat longestHeight = 0;
    for(int i = 0;i < 3;i++)
    {
        // 获取高度
        CGFloat currentHeight = [self.columnHeights[i] floatValue];
        // 判断，选出最长高度
        if (currentHeight > longestHeight) {
            longestHeight = currentHeight;
            longestIndex = i;
        }
    }
    return longestIndex;
}

- (void)getItemOriginPoint
{  // 记录最小高度列所在的索引
    NSInteger shortestIndex = 0;
    // 记录最小值
    CGFloat shortestHeight = MAXFLOAT;
    for (int i = 0; i < 3; i++) {
        // 获取当前高度
        CGFloat currentHeight = [self.columnHeights[i] floatValue];
        if (currentHeight < shortestHeight) {
            shortestHeight = currentHeight;
            shortestIndex = i;
        }
    }
    self.shortestIndex = shortestIndex;
   
    // 计算x值：内边距left + （item宽 + item的间距）* 索引
    self.xForItemOrigin = 10 + (self.itemSize.width +self.insertItemSpacing) * shortestIndex;
    // 计算y值
    self.yForItemOrigin = shortestHeight + self.insertItemSpacing;
    
}

// 设置属性和frame
- (void)setFrame:(NSIndexPath *)indexPath
{
    
    // 设置item layoutAttribute属性
    UICollectionViewLayoutAttributes *layoutArr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // 获取item的高
    CGFloat itemHeight = 0;
    
    if (_delegate && [_delegate respondsToSelector:@selector(heightForItemIndexPath:)]) {
        // 使用代理方法获取item的高
        itemHeight = [self.delegate heightForItemIndexPath:indexPath];
    }
    // 设置frame
    layoutArr.frame = CGRectMake(self.xForItemOrigin, self.yForItemOrigin, self.itemSize.width, itemHeight);
    // 放入数组
    [self.arrForAtrributes addObject:layoutArr];
    // 更新高度
    self.columnHeights[_shortestIndex] = @(self.yForItemOrigin +itemHeight);
}





@end
