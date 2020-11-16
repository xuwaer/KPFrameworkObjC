//
//  UIApplication+KPExtensions.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/12.
//

#import <UIKit/UIKit.h>

@interface UIApplication (KPExtensions)

/**
 因为系统不同，打开url的方式不同，因此需要提供兼容方案
 [[self shareApplication] openURL:xxx]
 */
+ (void)kp_openURLCompatible:(NSURL *)url;

/**
 获取当前window下的最上层界面
 */
+ (UIViewController *)kp_topViewController;

@end
