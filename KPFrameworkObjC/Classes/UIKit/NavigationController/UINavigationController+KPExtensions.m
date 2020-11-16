//
//  UINavigationController+KPExtensions.m
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/23.
//

#import "UINavigationController+KPExtensions.h"
#import "NSMutableArray+KPExtensions.h"
#import "NSArray+KPExtensions.h"

@implementation UINavigationController (KPExtensions)

/**
 push 一组 viewController
 */
- (void)kp_pushViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    NSMutableArray *controllers = [self.viewControllers mutableCopy];
    [controllers kp_addNNilObjectsFromArray:viewControllers];
    [self setViewControllers:controllers animated:animated];
}


/**
 从指定的index开始替换掉之后的viewContollers
 */
- (void)kp_pushAtIndex:(NSUInteger)index withViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self kp_pushAtIndex:index withViewControllers:@[viewController] animated:animated];
}

- (void)kp_pushAtIndex:(NSUInteger)index withViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    NSMutableArray *controllers = [[self.viewControllers kp_take:index] mutableCopy];
    [self setViewControllers:[controllers kp_addObjectsFromArray:viewControllers] animated:animated];
}

- (void)kp_pushAtTopWithViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self kp_pushAtIndex:(NSUInteger)(self.viewControllers.count - 1) withViewController:viewController animated:animated];
}

- (void)kp_pushAtTopWithViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    [self kp_pushAtIndex:(NSUInteger)(self.viewControllers.count - 1) withViewControllers:viewControllers animated:animated];
}

/**
 回退到指定的index位置 (如果index过大，则pop一层)
 */
- (void)kp_popToViewControllerByIndex:(NSUInteger)index animated:(BOOL)animated
{
    if (index > self.viewControllers.count - 1) {
        [self popViewControllerAnimated:animated];
    }
    else {
        [self popToViewController:[self.viewControllers objectAtIndex:index] animated:animated];
    }
}

/**
 回退到express返回true的位置 (如果没有符合的，则pop一层)
 */
- (void)kp_popToViewControllerBy:(kpNavigationControllerValueCondition)condition animated:(BOOL)animated
{
    UIViewController *controller = [self.viewControllers.kp_reverse kp_find:condition];
    if (controller == nil) {
        [self popViewControllerAnimated:animated];
    }
    else {
        [self popToViewController:controller animated:animated];
    }
}

/**
 如果有符合condition的controller，则pop到该controller。没有则push一个新的
 */
- (void)kp_pushOrPopToViewController:(UIViewController *)controller by:(kpNavigationControllerValueCondition)condition animated:(BOOL)animated
{
    UIViewController *anController = [self.viewControllers.kp_reverse kp_find:condition];
    if (anController == nil) {
        [self pushViewController:controller animated:animated];
    }
    else {
        [self popToViewController:anController animated:animated];
    }
}

/**
 禁用pop
 */
- (void)kp_disablePopGesture:(BOOL)disable
{
    self.interactivePopGestureRecognizer.enabled = !disable;
}

@end
