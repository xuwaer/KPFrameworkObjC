//
//  UIView+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 基础部分
 */
@interface UIView (KPExtensions)

/**
 通过nib生成view
 */
+ (UIView *)kp_loadWithNibName:(NSString *)name;
+ (UIView *)kp_loadWithNibName:(NSString *)name inBundle:(NSBundle *)bundle;

/**
 子layer操作
 */
- (CALayer *)kp_layerForName:(NSString *)name;
- (void)kp_removeLayerForName:(NSString *)name;

/**
 相关ui设置
 */
/**
 圆角
 */
- (void)kp_addCorners:(CGFloat)radius;

/**
 部分圆角,指定top/left/bottom/right
 */
- (void)kp_addRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)radius;

/**
 描边
 */
- (void)kp_addBorder:(UIColor *)color width:(CGFloat)width;

@end
 
