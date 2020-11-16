//
//  UIViewController+KPUI.h
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/20.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KPNavigation)

/**
 导航栏不覆盖内容
 */
- (void)kp_contentUnderNavigationBar;

/**
 更新状态栏样式
 */
- (void)kp_updateStatusBarStyle;

/**
 导航栏title样式
 */
- (void)kp_setNavigationTitleAttribute:(NSDictionary *)attribute;

/**
 导航栏title
 */
- (void)kp_setNavigationTitle:(NSString *)title;

/**
 导航栏背景image
 */
- (void)kp_setNavigationBackgroundImage:(UIImage *)backgroundImage;

/**
 导航栏背景color
 */
- (void)kp_setNavigationBackgroundColor:(UIColor *)color;

/**
 导航栏透明
 */
- (void)kp_setNavigationTransparent;

/**
 导航栏阴影线
 */
- (void)kp_setNavigationShadowImage:(UIImage *)image;

/**
 导航栏左边按钮
 */
- (void)kp_setNavigationLeftItems:(NSArray *)items;

/**
 导航栏右边按钮
 */
- (void)kp_setNavigationRightItems:(NSArray *)items;

@end
