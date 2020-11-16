//
//  KPTextBadge.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/19.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSUInteger const KPTextBadgeTag;

@interface KPTextBadge : UILabel

// 提示点颜色,默认红色
@property (nonatomic, strong) UIColor *color;
// 最小,默认(0, 0)
@property (nonatomic, assign) CGSize minSize;
@property (nonatomic, assign) CGFloat horizontalTextPadding;
@property (nonatomic, assign) CGFloat verticalTextPadding;
// 边框
@property (nonatomic, assign) CGFloat borderWidth;
// 边框颜色
@property (nonatomic, strong) UIColor *borderColor;

// 这里会放置到指定的view中
- (void)showAtPoint:(CGPoint)point inView:(UIView *)view;

@end
