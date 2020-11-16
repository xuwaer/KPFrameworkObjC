//
//  UIView+KPGesture.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/11/30.
//

#import "UIView+KPGesture.h"
#import <objc/runtime.h>

static char *kpOnTapKey, *kpOnTapGestureKey;

@implementation UIView (KPGesture)

#pragma mark - private

- (void)setupTapGesture
{
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self addGestureRecognizer:self.tapGesture];
}

- (void)resetTapGesture
{
    UITapGestureRecognizer *gesture = self.tapGesture;
    if (gesture) [self removeGestureRecognizer:gesture];
    self.tapGesture = nil;
}

- (void)onTap:(UIGestureRecognizer *)gesture
{
    if (self.kp_onTap) self.kp_onTap(self);
}

#pragma mark - getter/setter

- (UITapGestureRecognizer *)tapGesture
{
    return objc_getAssociatedObject(self, &kpOnTapGestureKey);
}

- (void)setTapGesture:(UITapGestureRecognizer *)tapGesture
{
    objc_setAssociatedObject(self, &kpOnTapGestureKey, tapGesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UIView *))kp_onTap
{
    return objc_getAssociatedObject(self, &kpOnTapKey);
}

- (void)setKp_onTap:(void (^)(UIView *))kp_onTap
{
    [self resetTapGesture];
    if (kp_onTap) [self setupTapGesture];
    objc_setAssociatedObject(self, &kpOnTapKey, kp_onTap, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
