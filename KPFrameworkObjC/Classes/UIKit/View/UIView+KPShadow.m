//
//  UIView+KPShadow.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIView+KPShadow.h"
#import "UIView+KPExtensions.h"

kpViewLayerKey const kpViewLayerKey_Shadow = @"kpViewLayerKey_Shadow";

@implementation UIView (KPShadow)

/**
 设置阴影.因为UIView存在剪切的问题,因此阴影只能设置在父类上.请保证superView不为nil
 因为autolayout的原因,该方法的调用推荐放在-layoutSubViews和-drawRect:的时候
 默认offset = CGSizeMake(0, 2), opacity = 2
 */
- (void)kp_addShadowInSuperView:(UIColor *)color
{
    [self kp_addShadowInSuperView:color offset:CGSizeMake(0, 4) opacity:0.4];
}

- (void)kp_addShadowInSuperView:(UIColor *)color offset:(CGSize)offset opacity:(CGFloat)opacity
{
    if (self.superview == nil) return;
    CALayer *shadowLayer = [self.superview kp_layerForName:kpViewLayerKey_Shadow];
    if (shadowLayer == nil) {
        shadowLayer = [CAShapeLayer layer];
        shadowLayer.name = kpViewLayerKey_Shadow;
        [self.superview.layer insertSublayer:shadowLayer below:self.layer];
    }
    shadowLayer.backgroundColor = [color CGColor];
    shadowLayer.shadowColor = [color CGColor];
    shadowLayer.shadowRadius = 2;
    shadowLayer.cornerRadius = self.layer.cornerRadius;
    shadowLayer.shadowOpacity = opacity;
    shadowLayer.shadowOffset = offset;
    shadowLayer.frame = self.frame;
}

- (void)kp_removeShadow
{
    [self kp_removeLayerForName:kpViewLayerKey_Shadow];
}

- (void)kp_addLightShadowInSuperView
{
    [self kp_addShadowInSuperView:[UIColor lightGrayColor]];
}

- (void)kp_addDarkShadowInSuperView
{
    [self kp_addShadowInSuperView:[UIColor darkGrayColor]];
}

@end
