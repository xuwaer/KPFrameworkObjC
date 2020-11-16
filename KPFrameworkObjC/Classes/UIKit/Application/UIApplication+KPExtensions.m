//
//  UIApplication+KPExtensions.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/12.
//

#import "UIApplication+KPExtensions.h"
#import "KPDeviceMacro.h"
#import "UIViewController+KPExtensions.h"

@implementation UIApplication (KPExtensions)

#pragma mark - public

+ (void)kp_openURLCompatible:(NSURL *)url
{
    if (url == nil) return;
    if (kpiOS10_OR_LATER) {
        [[self sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
    else {
        [[self sharedApplication] openURL:url];
    }
}

+ (UIViewController *)kp_topViewController
{
    return [[[[UIApplication sharedApplication] keyWindow] rootViewController] kp_topViewController];
}

@end
