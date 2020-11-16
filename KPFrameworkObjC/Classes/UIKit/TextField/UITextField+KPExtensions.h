//
//  UITextField+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 textField 的常用功能分类
 */
@interface UITextField (KPExtensions)

/**
 提示文字, 这里使用了keyPath的方式获取到了私有属性,慎用(暂时审核还能通过)
 iOS6以后的版本推荐使用 attributedPlaceholder
 */
@property (nonatomic, strong) UIColor *kp_placeholderColor;
@property (nonatomic, strong) UIFont *kp_placeholderFont;

@end
