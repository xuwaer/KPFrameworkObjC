//
//  UIButton+KPTouch.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/21.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIButton+KPTouch.h"
#import <objc/runtime.h>

@implementation UIButton (KPTouch)

static const char *kpExpandAreaKey, *kpActionKey;

- (void)kp_exchangeTouchableArea:(UIEdgeInsets)edgeInsets
{
    objc_setAssociatedObject(self, &kpExpandAreaKey, NSStringFromUIEdgeInsets(edgeInsets), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets insets = UIEdgeInsetsFromString(objc_getAssociatedObject(self, &kpExpandAreaKey));
    CGRect changedRect = UIEdgeInsetsInsetRect(self.bounds, insets);
    if (CGRectEqualToRect(changedRect, self.bounds))
        return [super hitTest:point withEvent:event];
    else
        return CGRectContainsPoint(changedRect, point) ? self : nil;
}

- (void)kp_addActionHandler:(KPButtonActionHandler)handler
{
    objc_setAssociatedObject(self, &kpActionKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(kp_blockAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)kp_blockAction:(UIButton *)button
{
    KPButtonActionHandler handler = objc_getAssociatedObject(self, &kpActionKey);
    if (handler) {
        handler(button.tag);
    }
}

@end
