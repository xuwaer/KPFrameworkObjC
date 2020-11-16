//
//  KPCollectionViewFlowLayout.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2018/3/19.
//

#import "KPCollectionViewFlowLayout.h"
#import "NSMutableArray+KPExtensions.h"

@interface KPCollectionViewFlowLayout ()

// 每个item的样式
@property (nonatomic, strong) NSMutableArray *itemAttributes;
// 内容高度
@property (nonatomic, assign) CGFloat contentHeight;

@end

@implementation KPCollectionViewFlowLayout

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.alignment = Left;
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.alignment = Left;
    }
    return self;
}

#pragma mark - private 重写父类布局

- (void)prepareLayout
{
    switch (self.alignment) {
        case Left:
            self.contentHeight = [self prepareLeftLayout:self.collectionView.frame.size.width];
            break;
        case Right:
            self.contentHeight = [self prepareRightLayout:self.collectionView.frame.size.width];
            break;
        default:
            self.contentHeight = [self prepareCenterLayout:self.collectionView.frame.size.width];
            break;
    }
}

/**
 左对齐样式
 */
- (CGFloat)prepareLeftLayout:(CGFloat)limitWidth
{
    [self.itemAttributes removeAllObjects];
    
    CGFloat offsetY = 0;
    CGFloat offsetX = 0;
    for (int section = 0; section < [self sectionNumbers]; section++) {
        // section top
        offsetY += self.sectionInset.top;
        offsetX = self.sectionInset.left;
        
        // 计算header的attribute
        UICollectionViewLayoutAttributes *headerAttributes = [self createHeaderLayoutAttributes:[NSIndexPath indexPathForRow:0 inSection:section]];
        if (headerAttributes) {
            CGRect headerFrame = headerAttributes.frame;
            headerFrame.origin.x = offsetX;
            headerFrame.origin.y = offsetY;
            headerAttributes.frame = headerFrame;
            [self.itemAttributes addObject:headerAttributes];
            offsetY += headerFrame.size.height;
        }
        
        // 计算item的attribute
        int maxItemHeight = 0;     // item 高度可能不一样，所以需要一个变量保存
        for (int index = 0; index < [self itemNumbersForSection:section]; index ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:section];
            UICollectionViewLayoutAttributes *itemAttributes = [self createItemLayoutAttributes:indexPath];
            CGRect itemFrame = itemAttributes.frame;
            if (offsetX + itemFrame.size.width + self.sectionInset.right > limitWidth) {
                // 超出宽度，换行
                offsetX = self.sectionInset.left;
                offsetY += self.minimumLineSpacing + maxItemHeight;
                // 复位记录下一行
                maxItemHeight = 0;
            }
            
            // 记录最大的item高度
            maxItemHeight = MAX(maxItemHeight, itemFrame.size.height);
            
            itemFrame.origin.x = offsetX;
            itemFrame.origin.y = offsetY;
            itemAttributes.frame = itemFrame;
            [self.itemAttributes addObject:itemAttributes];
            
            // 向右偏移坐标
            offsetX = CGRectGetMaxX(itemFrame) + self.minimumInteritemSpacing;
        }
        
        offsetX = self.sectionInset.left;
        // 计算最后一个item高度
        offsetY += maxItemHeight;
        
        // 计算footer的attribute
        UICollectionViewLayoutAttributes *footerAttributes = [self createFooterLayoutAttributes:[NSIndexPath indexPathForRow:0 inSection:section]];
        if (footerAttributes) {
            CGRect footerFrame = footerAttributes.frame;
            footerFrame.origin.x = offsetX;
            footerFrame.origin.y = offsetY;
            footerAttributes.frame = footerFrame;
            [self.itemAttributes addObject:footerAttributes];
            offsetY += footerFrame.size.height;
        }
        
        // section bottom
        offsetY += self.sectionInset.bottom;
    }
    
    return offsetY;
}

- (CGFloat)prepareCenterLayout:(CGFloat)limitWidth
{
    return 0;
}

- (CGFloat)prepareRightLayout:(CGFloat)limitWidth
{
    return 0;
}

/**
 创建header的attributes
 */
- (UICollectionViewLayoutAttributes *)createHeaderLayoutAttributes:(NSIndexPath *)indexPath
{
    CGSize headerSize = [self sectionHeaderSizeForSecion:indexPath.section];
    if (CGSizeEqualToSize(headerSize, CGSizeZero)) {
        // zero 表示没有header
        return nil;
    }
    else {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:indexPath];
        attributes.frame = CGRectMake(0, 0, headerSize.width, headerSize.height);
        return attributes;
    }
}

/**
 创建footer的attributes
 */
- (UICollectionViewLayoutAttributes *)createFooterLayoutAttributes:(NSIndexPath *)indexPath
{
    CGSize footerSize = [self sectionFooterSizeForSecion:indexPath.section];
    if (CGSizeEqualToSize(footerSize, CGSizeZero)) {
        // zero 表示没有footer
        return nil;
    }
    else {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:indexPath];
        attributes.frame = CGRectMake(0, 0, footerSize.width, footerSize.height);
        return attributes;
    }
}

/**
 创建cell的attributes
 */
- (UICollectionViewLayoutAttributes *)createItemLayoutAttributes:(NSIndexPath *)indexPath
{
    CGSize itemSize = [self itemSizeForIndexPath:indexPath];
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(0, 0, itemSize.width, itemSize.height);
    return attributes;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.itemAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGRect oldBounds = self.collectionView.bounds;
    
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds)) {
        return YES;
    }
    
    return NO;
}

- (CGSize)sectionHeaderSizeForSecion:(NSInteger)section
{
    id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    if ([delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]) {
        return [delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:section];
    }
    else {
        return self.headerReferenceSize;
    }
}

- (CGSize)sectionFooterSizeForSecion:(NSInteger)section
{
    id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    if ([delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]) {
        return [delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:section];
    }
    else {
        return self.footerReferenceSize;
    }
}

- (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath
{
    id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    if ([delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        return [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    else {
        return self.itemSize;
    }
}

- (NSUInteger)sectionNumbers
{
    return [self.collectionView numberOfSections];
}

- (NSUInteger)itemNumbersForSection:(NSUInteger)section
{
    return [self.collectionView numberOfItemsInSection:section];
}

#pragma mark - public

- (CGSize)prepareLayoutWithMaxWidth:(CGFloat)limitWidth
{
    CGFloat height = 0;
    switch (self.alignment) {
        case Left:
            height = [self prepareLeftLayout:limitWidth];
            break;
        case Right:
            height = [self prepareRightLayout:limitWidth];
            break;
        default:
            height = [self prepareCenterLayout:limitWidth];
            break;
    }
    return CGSizeMake(limitWidth, height);
}

#pragma mark - getter/setter

- (NSMutableArray *)itemAttributes
{
    if (_itemAttributes == nil) {
        _itemAttributes = [NSMutableArray new];
    }
    return _itemAttributes;
}

@end
