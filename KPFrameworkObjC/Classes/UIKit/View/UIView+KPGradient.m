//
//  UIView+KPGradient.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIView+KPGradient.h"
#import "UIView+KPExtensions.h"

kpViewLayerKey const kpViewLayerKey_Gradient = @"kpViewLayerKey_Gradient";

@implementation UIView (KPGradient)

- (CAGradientLayer *)kp_addGradientBackgroundFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor
{
    return [self kp_addGradientBackgroundFromColor:fromColor toColor:toColor fromPoint:CGPointZero toPoint:CGPointZero];
}

- (CAGradientLayer *)kp_addGradientBackgroundFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
    return [self kp_addGradientBackgroundFromColor:fromColor toColor:toColor fromPoint:CGPointZero toPoint:CGPointZero edgeInset:UIEdgeInsetsZero];
}

- (CAGradientLayer *)kp_addGradientBackgroundFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint edgeInset:(UIEdgeInsets)edgeInset
{
    CAGradientLayer *backgroundLayer = (CAGradientLayer *)[self kp_layerForName:kpViewLayerKey_Gradient];
    if (backgroundLayer == nil) {
        backgroundLayer = [CAGradientLayer layer];
        backgroundLayer.name = kpViewLayerKey_Gradient;
        backgroundLayer.frame = UIEdgeInsetsInsetRect(self.bounds, edgeInset);
        
        if (!CGPointEqualToPoint(fromPoint, toPoint)) {
            backgroundLayer.startPoint = fromPoint;
            backgroundLayer.endPoint = toPoint;
        }
        
        backgroundLayer.colors = @[(__bridge id)fromColor.CGColor, (__bridge id)toColor.CGColor];
        [self.layer insertSublayer:backgroundLayer atIndex:0];
    }
    else {
        backgroundLayer.frame = UIEdgeInsetsInsetRect(self.bounds, edgeInset);

        if (!CGPointEqualToPoint(fromPoint, toPoint)) {
            backgroundLayer.startPoint = fromPoint;
            backgroundLayer.endPoint = toPoint;
        }
        
        backgroundLayer.colors = @[(__bridge id)fromColor.CGColor, (__bridge id)toColor.CGColor];
    }
    return backgroundLayer;
}

- (void)kp_removeGradientBackground
{
    [self kp_removeLayerForName:kpViewLayerKey_Gradient];
}



@end
