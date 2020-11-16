//
//  UIViewController+KPAdditional.h
//  KPProjectModel
//
//  Created by 徐恺君 on 15/3/3.
//  Copyright (c) 2015年 kp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KPExtensions)

/**
 从storyboard创建实例
 */
+ (instancetype)kp_fromStoryboard:(NSString *)storyboard identifier:(NSString *)identifier bundle:(NSBundle *)bundle;

/**
 pop/dismiss 操作
 */
- (void)kp_pop; // animation YES
- (void)kp_dismiss; // animation YES

/**
 获取该viewController的最上层controller
 */
- (UIViewController *)kp_topViewController;

@end
