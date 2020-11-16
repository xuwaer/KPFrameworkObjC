//
//  UITableView+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 table相关
 */
@interface UITableView (KPExtensions)

/**
 可见性
 在复用cell的情况下kp_isVisibleCell可能会得出错误的结果,请注意
 */
- (BOOL)kp_isVisibleCell:(UITableViewCell *)cell;
- (BOOL)kp_isVisibleIndexPath:(NSIndexPath *)indexPath;

/**
 reload动画,渐隐渐现
 */
- (void)kp_reloadDataAnimated:(BOOL)animated;

/**
 滚动到指定的index
 */
- (void)kp_scrollToIndexPath:(NSIndexPath *)indexPath;


/**
 配置UITableView全局兼容
 iOS11下，如果没有设置estimateRowHeight的值，也没有设置rowHeight的值，那contentSize计算初始值是44
 */
+ (void)kp_appearanceCompatible;

/**
 配置单个的tableview兼容。
 */
- (void)kp_compatible;

@end
