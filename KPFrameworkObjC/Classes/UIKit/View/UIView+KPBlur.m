//
//  UIView+KPBlur.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIView+KPBlur.h"
#import "KPDeviceMacro.h"
#import "UIView+KPExtensions.h"

kpViewTag const kpViewTag_Blur = 0x80000001;

@implementation UIView (KPBlur)

- (UIVisualEffectView *)kp_addBlur:(UIBlurEffectStyle)style
{
    if (kpiOS8_OR_LATER) {
        UIVisualEffectView *blurView = [self viewWithTag:kpViewTag_Blur];
        if (blurView == nil) {
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
            blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            blurView.frame = self.bounds;
            blurView.tag = kpViewTag_Blur;
            [self addSubview:blurView];
        }
        else {
            blurView.frame = self.bounds;
            blurView.effect = [UIBlurEffect effectWithStyle:style];
        }
        return blurView;
    }
    
    return nil;
}

- (void)kp_removeBlur
{
    [[self viewWithTag:kpViewTag_Blur] removeFromSuperview];
}

@end
