//
//  UIView+KPShadow.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "KPViewConst.h"

UIKIT_EXTERN kpViewLayerKey const kpViewLayerKey_Shadow;

/**
 阴影
 */
@interface UIView (KPShadow)

/**
 设置阴影.因为UIView存在剪切的问题,因此阴影只能设置在父类上.请保证superView不为nil
 因为autolayout的原因,该方法的调用推荐放在-layoutSubViews或-drawRect:的时候
 默认offset = CGSizeMake(0, 2), opacity = 2
 */
- (void)kp_addShadowInSuperView:(UIColor *)color;
- (void)kp_addShadowInSuperView:(UIColor *)color offset:(CGSize)offset opacity:(CGFloat)opacity;
- (void)kp_removeShadow;

- (void)kp_addLightShadowInSuperView;
- (void)kp_addDarkShadowInSuperView;

@end
