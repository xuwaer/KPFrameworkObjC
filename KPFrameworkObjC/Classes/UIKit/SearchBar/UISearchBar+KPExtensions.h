//
//  UISearchBar+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UISearchBar 的常用功能分类
 */
@interface UISearchBar (KPExtensions)

/**
 通过key-value获取textfield
 */
@property (nonatomic, strong, readonly) UITextField *textField;

/**
 设置透明, 仅设置barTintColor: clearColor 会导致黑色背景
 */
- (void)kp_setTransparent;

@end
