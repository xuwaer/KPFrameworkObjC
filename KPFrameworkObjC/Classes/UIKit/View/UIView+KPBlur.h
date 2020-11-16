//
//  UIView+KPBlur.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "KPViewConst.h"

UIKIT_EXTERN kpViewTag const kpViewTag_Blur;

/**
 模糊处理
 */
@interface UIView (KPBlur)

- (UIVisualEffectView *)kp_addBlur:(UIBlurEffectStyle)style;
- (void)kp_removeBlur;

@end
