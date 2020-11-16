//
//  KPDotBadge.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/19.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSUInteger const KPDotBadgeTag;

/**
 红点提示
 */
@interface KPDotBadge : UIView

// 提示点颜色,默认红色
@property (nonatomic, strong) UIColor *color;
// 大小,默认(8, 8)
@property (nonatomic, assign) CGSize size;
// 边框
@property (nonatomic, assign) CGFloat borderWidth;
// 边框颜色
@property (nonatomic, strong) UIColor *borderColor;

// 这里会放置到指定的view中
- (void)showAtPoint:(CGPoint)point inView:(UIView *)view;

@end
