//
//  KPCollectionViewFlowLayout.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2018/3/19.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(int, KPCollectionAlignment) {
    Center,
    Left,
    Right
};

/**
 collection view 布局
 */
@interface KPCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) KPCollectionAlignment alignment;

/**
 计算flow layout 大小
 */
- (CGSize)prepareLayoutWithMaxWidth:(CGFloat)width;

@end
