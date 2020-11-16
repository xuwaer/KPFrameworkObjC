//
//  KPCompatible.m
//  Yiqijiao
//
//  Created by yiqijiao_xukaijun on 2018/4/13.
//  Copyright © 2018年 yiqijiao. All rights reserved.
//

#import "UIBarButtonItem+KPCompatible.h"
#import "KPDeviceMacro.h"
#import "NSArray+KPExtensions.h"

@implementation UIBarButtonItem (KPCompatible)

- (void)kp_iOS11CompatibleForLeftCustomButtonMargin:(CGFloat)left
{
    if (kpiOS11_OR_LATER) {
        if ([self.customView isKindOfClass:UIButton.class]) {
            UIButton *button = self.customView;
            button.contentEdgeInsets = UIEdgeInsetsMake(0, left, 0, 0);
        }
    }
}

- (void)kp_iOS11CompatibleForRightCustomButtonMargin:(CGFloat)right
{
    if (kpiOS11_OR_LATER) {
        if ([self.customView isKindOfClass:UIButton.class]) {
            UIButton *button = self.customView;
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, right);
        }
    }
}

@end


@implementation NSArray (KPUIBarButtonItemCompatible)

- (NSArray *)kp_compatibleLeftBarItems
{
    if (self.count <= 0) {
        return nil;
    }
    
    if (kpiOS11_OR_LATER) {
//        return [self kp_map:^id(UIBarButtonItem *item) {
//            [item kp_iOS11CompatibleForLeftCustomButtonMargin:-20];
//            return item;
//        }];
        return self;
    }
    
    if (kpiOS10_OR_LATER) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -18;
        return [@[negativeSpacer] kp_concat:self];
    }
    
    if (kpiOS7_OR_LATER) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -16;
        return [@[negativeSpacer] kp_concat:self];
    }
    
    return self;
}

- (NSArray *)kp_compatibleRightBarItems
{
    if (self.count <= 0) {
        return nil;
    }
    
    if (kpiOS11_OR_LATER) {
//        return [self kp_map:^id(UIBarButtonItem *item) {
//            [item kp_iOS11CompatibleForLeftCustomButtonMargin:-20];
//            return item;
//        }];
        return self;
    }
    
    if (kpiOS10_OR_LATER) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -18;
        return [@[negativeSpacer] kp_concat:self];
    }
    
    if (kpiOS7_OR_LATER) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -16;
        return [@[negativeSpacer] kp_concat:self];
    }
    
    return self;
}

@end
