//
//  UIButton+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIButton+KPExtensions.h"
#import "UIImage+KPExtensions.h"
#import "UIView+KPFrame.h"

@implementation UIButton (KPExtensions)

/**
 *  图片适配
 */
- (void)kp_setFitImageSize
{
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.clipsToBounds = YES;
    self.clipsToBounds = YES;
}

- (void)kp_setFillImageSize
{
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.clipsToBounds = YES;
}


/**
 因为很多情况仅需要设置button的normal state,所以这里提供便捷的方法设置
 */
- (void)kp_setTitleForNormalState:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)kp_setAttributeTitleForNormalState:(NSAttributedString *)title
{
    [self setAttributedTitle:title forState:UIControlStateNormal];
}

- (void)kp_setImageForNormalState:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)kp_setBackgroundImageForNormalState:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)kp_setBackgroundColorForNormalState:(UIColor *)color
{
    [self kp_setBackgroundColor:color forState:UIControlStateNormal];
}

- (void)kp_setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    UIImage *backImage = [UIImage kp_imageWithColor:color];
    [self setBackgroundImage:backImage forState:state];
}


/**
 布局相关
 图文垂直居中(图片和文字上下居中排版),在设置图片和文字后才会有效,推荐在-layoutSubViews后调用
 文图水平居中(文字左边, 图片右边的水平居中排版),在设置图片和文字后才会有效,推荐在-layoutSubViews后调用
 */
- (void)kp_setAlignmentImageTextVetical
{
    self.titleEdgeInsets = UIEdgeInsetsMake(self.imageView.kp_height, 0 - self.imageView.kp_width, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0 - self.titleLabel.kp_height, 0, 0, 0 - self.titleLabel.kp_width);
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

- (void)kp_setAlignmentTextImageHorizontal
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0 - self.imageView.kp_width, 0, self.imageView.kp_width);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.kp_width, 0, 0 - self.titleLabel.kp_width);
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}

@end
