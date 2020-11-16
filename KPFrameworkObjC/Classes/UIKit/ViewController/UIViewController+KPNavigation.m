//
//  UIViewController+KPUI.m
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/20.
//

#import "UIViewController+KPNavigation.h"
#import "KPDeviceMacro.h"
#import "KPGlobalMacro.h"
#import "NSMutableArray+KPExtensions.h"
#import "NSArray+KPExtensions.h"
#import "UIBarButtonItem+KPCompatible.h"

@implementation UIViewController (KPNavigation)

/**
 导航栏不覆盖内容
 */
- (void)kp_contentUnderNavigationBar
{
    // 导航栏不透明
    self.extendedLayoutIncludesOpaqueBars = NO;
    // 设置内容页不被导航栏覆盖
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    // iOS11以后会废弃
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/**
 更新状态栏样式
 */
- (void)kp_updateStatusBarStyle
{
    [self setNeedsStatusBarAppearanceUpdate];
}

/**
 导航栏title样式
 */
- (void)kp_setNavigationTitleAttribute:(NSDictionary *)attribute
{
    self.navigationController.navigationBar.titleTextAttributes = attribute;
}

/**
 导航栏title
 */
- (void)kp_setNavigationTitle:(NSString *)title
{
    self.navigationItem.title = title;
}

/**
 导航栏背景image
 */
- (void)kp_setNavigationBackgroundImage:(UIImage *)backgroundImage
{
    // 禁止导航栏透明
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
}

/**
 导航栏背景color
 */
- (void)kp_setNavigationBackgroundColor:(UIColor *)color
{
    // 禁止导航栏透明
    self.navigationController.navigationBar.translucent = NO;
    if (kpiOS7_OR_LATER) [self.navigationController.navigationBar setBarTintColor:color];
    else [self.navigationController.navigationBar setTintColor:color];
}

/**
 导航栏透明
 */
- (void)kp_setNavigationTransparent
{
    // 设置导航栏透明
    self.navigationController.navigationBar.translucent = YES;
    // 去掉系统默认导航栏样式
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    // 设置内容页全屏
    self.edgesForExtendedLayout = UIRectEdgeAll;
}

/**
 导航栏阴影线
 */
- (void)kp_setNavigationShadowImage:(UIImage *)image
{
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

/**
 导航栏左边按钮
 */
- (void)kp_setNavigationLeftItems:(NSArray *)items
{
    self.navigationItem.leftBarButtonItems = [items kp_compatibleLeftBarItems];
}

/**
 导航栏右边按钮
 */
- (void)kp_setNavigationRightItems:(NSArray *)items
{
    self.navigationItem.rightBarButtonItems = [items kp_compatibleRightBarItems];
}

@end
