
#import "WaterFlowLayout.h"

@interface WaterFlowLayout()
// 获取item的总数量
@property (nonatomic,assign) NSUInteger numberOfItems;

// 用来保存每一列的高度
@property (nonatomic,strong) NSMutableArray *columnHeights;

//用来保存每一个item计算好的属性（x,y,w,h）
@property (nonatomic,strong) NSMutableArray *itemAtrributes;
// 保存每个item的X值
@property (nonatomic, assign) CGFloat detalX;
// 保存每个item的Y值
@property (nonatomic, assign) CGFloat detalY;
// 纪录最短的列
@property (nonatomic, assign) NSInteger shortestIndex;

// 获取最长列的索引
- (NSInteger)p_indexForLongestColumn;
// 获取最短列索引
- (NSInteger)p_indexForShortestColumn;

@end

@implementation WaterFlowLayout
#pragma mark - collectionViewLayout类方法
// 准备布局
- (void)prepareLayout {
    NSLog(@"%s",__func__);
    // 调用父类布局
    [super prepareLayout];
    [self addHeightWithColumns];
    // 获取item的数量
    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
    // 为每一个item设置frame和indexPath
    for(int i = 0;i < self.numberOfItems;i++)
    {
        // 查找最短的列，并设置相关属性
        [self searchShortColumns];
        // 设置indexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
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
    contentSize.height = longestH + self.sectionInsets.bottom;
    return contentSize;
}
// 返回每一个item的attribute
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSLog(@"%s",__func__);
    // 返回每一个item的Attribute
    return self.itemAtrributes;
}





#pragma mark - feature
// 懒加载
- (NSMutableArray*)columnHeights
{
    if (!_columnHeights) {
        self.columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)itemAtrributes
{
    if (!_itemAtrributes) {
        self.itemAtrributes = [NSMutableArray array];
    }
    return _itemAtrributes;
}

// 获取最长列的索引
- (NSInteger)p_indexForLongestColumn
{
    // 记录那一列最长
    NSInteger longestIndex = 0;
    // 记录当前最长高度
    CGFloat longestHeight = 0;
    for(int i = 0;i < self.numberOfColumns;i++)
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
// 获取最短列索引
- (NSInteger)p_indexForShortestColumn
{
    // 记录索引
    NSInteger shortestIndex = 0;
    // 记录最小值
    CGFloat shortestHeight = MAXFLOAT;
    for (int i = 0; i < self.numberOfColumns; i++) {
        // 获取当前高度
        CGFloat currentHeight = [self.columnHeights[i] floatValue];
        if (currentHeight < shortestHeight) {
            shortestHeight = currentHeight;
            shortestIndex = i;
        }
    }
    return shortestIndex;
}

// 给每一列添加top高度
- (void)addHeightWithColumns
{
    for (int i = 0;i < self.numberOfColumns;i++){
        self.columnHeights[i] = @(self.sectionInsets.top);
    }
}


// 查找最短的列，并设置相关属性
- (void)searchShortColumns
{
    _shortestIndex = [self p_indexForShortestColumn];
    CGFloat shortestH = [self.columnHeights[_shortestIndex] floatValue];
    // 计算x值：内边距left + （item宽 + item的间距）* 索引
    self.detalX = self.sectionInsets.left + (self.itemSize.width +self.insertItemSpacing) * _shortestIndex;
    // 计算y值
    self.detalY = shortestH + self.insertItemSpacing;
    
}

// 设置属性和frame
- (void)setFrame:(NSIndexPath *)indexPath
{
    // 设置属性
    UICollectionViewLayoutAttributes *layoutArr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // 保存item的高
    CGFloat itemHeight = 0;
    if (_delegate && [_delegate respondsToSelector:@selector(heightForItemIndexPath:)]) {
        // 使用代理方法获取item的高
        itemHeight = [_delegate heightForItemIndexPath:indexPath];
    }
    // 设置frame
    layoutArr.frame = CGRectMake(_detalX, _detalY, self.itemSize.width, itemHeight);
    // 放入数组
    [self.itemAtrributes addObject:layoutArr];
    // 更新高度
    self.columnHeights[_shortestIndex] = @(_detalY +itemHeight);
}





@end
