//
//  UITableView+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UITableView+KPExtensions.h"
#import "KPGlobalMacro.h"
#import "KPDeviceMacro.h"

@implementation UITableView (KPExtensions)

/**
 可见性
 */
- (BOOL)kp_isVisibleCell:(UITableViewCell *)cell
{
    return [[self visibleCells] containsObject:cell];
}

- (BOOL)kp_isVisibleIndexPath:(NSIndexPath *)indexPath
{
    return [[self indexPathsForVisibleRows] containsObject:indexPath];
}

/**
 reload动画,渐隐渐现
 */
- (void)kp_reloadDataAnimated:(BOOL)animated
{
    if (animated) {
        kpWeakSelf(self)
        [UIView transitionWithView:self duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            kpStrongSelf(self)
            [self reloadData];
        } completion:nil];
    }
    else {
        [self reloadData];
    }
}

/**
 滚动到指定的index
 */
- (void)kp_scrollToIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    [self scrollRectToVisible:cell.frame animated:YES];
}


/**
 配置UITableView全局兼容
 iOS11下，如果没有设置estimateRowHeight的值，也没有设置rowHeight的值，那contentSize计算初始值是44
 */
+ (void)kp_appearanceCompatible
{
    if (kpiOS11_OR_LATER) {
        UITableView *table = [UITableView appearance];
        table.estimatedRowHeight = 0;
        table.estimatedSectionHeaderHeight = 0;
        table.estimatedSectionFooterHeight = 0;
    }
}

/**
 配置单个的tableview兼容。
 */
- (void)kp_compatible
{
    if (kpiOS11_OR_LATER) {
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
}

@end
