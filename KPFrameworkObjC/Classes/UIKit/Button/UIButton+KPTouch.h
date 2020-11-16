//
//  UIButton+KPTouch.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/21.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KPButtonActionHandler)(NSUInteger tag);

/**
 触摸相关(点击、长按等)
 */
@interface UIButton (KPTouch)

/**
 调整button点击范围
 */
- (void)kp_exchangeTouchableArea:(UIEdgeInsets)edgeInsets;

/**
 点击事件
 */
- (void)kp_addActionHandler:(KPButtonActionHandler)handler;

@end
