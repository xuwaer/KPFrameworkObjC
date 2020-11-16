//
//  UIColor+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KPExtensions)

/**
 16进制rgb,转换为color
 */
+ (UIColor *)kp_colorWithRGBHex:(int32_t)hex;
+ (UIColor *)kp_colorWithRGBHex:(int32_t)hex alpha:(float)alpha;

+ (UIColor *)kp_colorWithRGBHexString:(NSString *)hexString;
+ (UIColor *)kp_colorWithRGBHexString:(NSString *)hexString alpha:(float)alpha;

+ (UIColor *)kp_randomColor;

@end
