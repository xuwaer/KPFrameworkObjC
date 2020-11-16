//
//  KPCompatible.h
//  Yiqijiao
//
//  Created by yiqijiao_xukaijun on 2018/4/13.
//  Copyright © 2018年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KPCompatible)

/**
 如果使用custom view 为 button的方式设置的button
 需要把图标向左、右移动来解决间隙过大的问题
 */
- (void)kp_iOS11CompatibleForLeftCustomButtonMargin:(CGFloat)left;
- (void)kp_iOS11CompatibleForRightCustomButtonMargin:(CGFloat)right;

@end


@interface NSArray (KPUIBarButtonItemCompatible)

- (NSArray *)kp_compatibleLeftBarItems;
- (NSArray *)kp_compatibleRightBarItems;

@end
