//
//  UIScrollView+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIScrollView+KPExtensions.h"
#import "UIView+KPFrame.h"
#import "KPDeviceMacro.h"
#import "KPHardwareTool.h"

@implementation UIScrollView (KPExtensions)

- (CGFloat)kp_contentWidth
{
    return self.contentSize.width;
}

- (void)setKp_contentWidth:(CGFloat)width
{
    self.contentSize = CGSizeMake(width, self.kp_contentWidth);
}

- (CGFloat)kp_contentHeight
{
    return self.contentSize.height;
}

- (void)setKp_contentHeight:(CGFloat)height
{
    self.contentSize = CGSizeMake(self.kp_contentWidth, height);
}

- (CGFloat)kp_contentOffsetX
{
    return self.contentOffset.x;
}

- (void)setKp_contentOffsetX:(CGFloat)x
{
    self.contentOffset = CGPointMake(x, self.kp_contentOffsetY);
}

- (CGFloat)kp_contentOffsetY
{
    return self.contentOffset.y;
}

- (void)setKp_contentOffsetY:(CGFloat)y
{
    self.contentOffset = CGPointMake(self.kp_contentOffsetX, y);
}

- (void)kp_scrollToTop:(BOOL)anim
{
    [self setContentOffset:CGPointMake(self.contentOffset.x, 0) animated:anim];
}

- (void)kp_scrollToBottom:(BOOL)anim
{
    [self setContentOffset:CGPointMake(self.contentOffset.x, self.contentSize.height - self.kp_height) animated:anim];
}

/**
 iOS11 - adjustedContentInset
 iOS11以前 - contentInset
 */
- (UIEdgeInsets)kp_contentInsets
{
    if (kpiOS11_OR_LATER) {
        return self.adjustedContentInset;
    }
    else {
        return self.contentInset;
    }
}

- (void)setKp_contentInsets:(UIEdgeInsets)kp_contentInsets
{
    self.contentInset = kp_contentInsets;
}

/**
 配置UIScrollView全局兼容
 iOS11 需要设置contentInsetAdjustmentBehavior = never 来替代以前的automaticallyAdjustsScrollViewInsets = NO
 */
+ (void)kp_appearanceCompatible
{
    if (kpiOS11_OR_LATER) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

/**
 配置UIScrollView的insets兼容
 (这里没有写到appearance的原因是有的scrollview并不需要关心safearea)
 */
- (void)kp_contentInsetsTopCompatible
{
    if (kpiOS11_OR_LATER) {
        if (kpIsIPhoneXGen) {
            self.contentInsetAdjustmentBehavior == UIScrollViewContentInsetAdjustmentNever;
            self.contentInset = UIEdgeInsetsMake(44, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
        }
    }
}

- (void)kp_contentInsetsBottomCompatible
{
    if (kpiOS11_OR_LATER) {
        if (kpIsIPhoneXGen) {
            self.contentInsetAdjustmentBehavior == UIScrollViewContentInsetAdjustmentNever;
            self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, 34, self.contentInset.right);
        }
    }
}

@end
