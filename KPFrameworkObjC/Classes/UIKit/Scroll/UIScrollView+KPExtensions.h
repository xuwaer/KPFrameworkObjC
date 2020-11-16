//
//  UIScrollView+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 滚动相关
 */
@interface UIScrollView (KPExtensions)

@property (nonatomic, assign) CGFloat kp_contentWidth;
@property (nonatomic, assign) CGFloat kp_contentHeight;
@property (nonatomic, assign) CGFloat kp_contentOffsetX;
@property (nonatomic, assign) CGFloat kp_contentOffsetY;

- (void)kp_scrollToTop:(BOOL)anim;
- (void)kp_scrollToBottom:(BOOL)anim;

/**
 iOS11 - adjustedContentInset
 iOS11以前 - contentInset
 */
@property (nonatomic, assign) UIEdgeInsets kp_contentInsets;

/**
 配置UIScrollView全局兼容
 iOS11 需要设置contentInsetAdjustmentBehavior = never 来替代以前的automaticallyAdjustsScrollViewInsets = NO
 */
+ (void)kp_appearanceCompatible;

/**
 配置UIScrollView的insets兼容
 (这里没有写到appearance的原因是有的scrollview并不需要关心safearea)
 */
- (void)kp_contentInsetsTopCompatible;
- (void)kp_contentInsetsBottomCompatible;

@end
