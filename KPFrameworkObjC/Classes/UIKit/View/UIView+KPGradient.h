//
//  UIView+KPGradient.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "KPViewConst.h"

UIKIT_EXTERN kpViewLayerKey const kpViewLayerKey_Gradient;

/**
 渐变
 */
@interface UIView (KPGradient)

/* The start and end points of the gradient when drawn into the layer's
 * coordinate space. The start point corresponds to the first gradient
 * stop, the end point to the last gradient stop. Both points are
 * defined in a unit coordinate space that is then mapped to the
 * layer's bounds rectangle when drawn. (I.e. [0,0] is the bottom-left
 * corner of the layer, [1,1] is the top-right corner.) The default values
 * are [.5,0] and [.5,1] respectively. Both are animatable. 
 */
- (CAGradientLayer *)kp_addGradientBackgroundFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor;
- (CAGradientLayer *)kp_addGradientBackgroundFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;
- (CAGradientLayer *)kp_addGradientBackgroundFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint edgeInset:(UIEdgeInsets)edgeInset;
- (void)kp_removeGradientBackground;

@end
