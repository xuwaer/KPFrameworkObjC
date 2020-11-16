//
//  UIButton+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 button的常用功能分类
 */
@interface UIButton (KPExtensions)

/**
 *  图片适配
 */
- (void)kp_setFitImageSize;
- (void)kp_setFillImageSize;

/**
 因为很多情况仅需要设置button的normal state,所以这里提供便捷的方法设置
 */
- (void)kp_setTitleForNormalState:(NSString *)title;
- (void)kp_setAttributeTitleForNormalState:(NSAttributedString *)title;
- (void)kp_setImageForNormalState:(UIImage *)image;
- (void)kp_setBackgroundImageForNormalState:(UIImage *)image;
- (void)kp_setBackgroundColorForNormalState:(UIColor *)color;

- (void)kp_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

/**
 布局相关
 1.图文垂直居中(图片和文字上下居中排版),在设置图片和文字后才会有效,推荐在-layoutSubViews后调用
 2.文图水平居中(文字左边, 图片右边的水平居中排版),在设置图片和文字后才会有效,推荐在-layoutSubViews后调用
 */
- (void)kp_setAlignmentImageTextVetical;
- (void)kp_setAlignmentTextImageHorizontal;

@end
