//
//  UINavigationController+KPExtensions.h
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/23.
//

#import <UIKit/UIKit.h>

typedef BOOL(^kpNavigationControllerValueCondition)(UIViewController *controller);

@interface UINavigationController (KPExtensions)

/**
 push 一组 viewController
 */
- (void)kp_pushViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated;

/**
 从指定的index开始替换掉之后的viewContollers
 */
- (void)kp_pushAtIndex:(NSUInteger)index withViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)kp_pushAtIndex:(NSUInteger)index withViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated;
- (void)kp_pushAtTopWithViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)kp_pushAtTopWithViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated;

/**
 回退到指定的index位置 (如果index过大，则pop一层)
 */
- (void)kp_popToViewControllerByIndex:(NSUInteger)index animated:(BOOL)animated;

/**
 回退到express返回true的位置，从最顶层开始找 (如果没有符合的，则pop一层)
 */
- (void)kp_popToViewControllerBy:(kpNavigationControllerValueCondition NS_NOESCAPE)condition animated:(BOOL)animated;

/**
 如果有符合condition的controller，则pop到该controller。没有则push一个新的
 */
- (void)kp_pushOrPopToViewController:(UIViewController *)controller by:(kpNavigationControllerValueCondition)condition animated:(BOOL)animated;

/**
 禁用pop
 */
- (void)kp_disablePopGesture:(BOOL)disable;

@end
