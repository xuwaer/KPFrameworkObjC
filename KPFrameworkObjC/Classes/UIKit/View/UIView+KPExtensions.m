//
//  UIView+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIView+KPExtensions.h"

@implementation UIView (KPExtensions)

/**
 通过nib生成view
 */
+ (UIView *)kp_loadWithNibName:(NSString *)name
{
    return [self kp_loadWithNibName:name inBundle:[NSBundle mainBundle]];
}

+ (UIView *)kp_loadWithNibName:(NSString *)name inBundle:(NSBundle *)bundle
{
    return [[bundle loadNibNamed:name owner:self options:nil] firstObject];
}

/**
 子layer操作
 */
- (CALayer *)kp_layerForName:(NSString *)name
{
    if (name == nil) return nil;
    CALayer *returnValue = nil;
    for (CALayer *subLayer in self.layer.sublayers) {
        if ([subLayer.name isEqualToString:name]) {
            returnValue = subLayer;
            break;
        }
    }
    return returnValue;
}

- (void)kp_removeLayerForName:(NSString *)name
{
    CALayer *layer = [self kp_layerForName:name];
    if (layer) [layer removeFromSuperlayer];
}


- (void)kp_addCorners:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
}

- (void)kp_addRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

- (void)kp_addBorder:(UIColor *)color width:(CGFloat)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
}

@end
