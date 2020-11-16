//
//  NSString+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 基础部分
 */
@interface NSString (KPExtensions)

/**
 当前时间+0~100的随机数
 */
+ (NSString *)kp_random;

/**
 文字的匹配度。通过正则表达式判断
 */
- (BOOL)kp_match:(NSString *)regex;

/**
 去掉首尾空格和换行
 */
- (NSString *)kp_trim;

/**
 切割
 */
- (NSArray *)kp_split:(NSString *)seperator;

/**
 空字符串操作
 */
+ (NSString *)kp_empty;
- (BOOL)kp_isEmpty;

/**
 文字大小计算
 */
- (CGSize)kp_sizeWithFont:(UIFont *)font limitSize:(CGSize)limit;

/**
 比较
 - (NSComparisonResult)kp_compare:(NSString *)string;
 - (NSComparisonResult)kp_compare:(NSString *)string option:(NSStringCompareOptions)option;
 数值类型比较
 e.g. "3.0.1" > "2.8.5", "3.0" > "2.8"
 - (NSComparisonResult)kp_compareNumberic:(NSString *)numbericString;
 */
- (NSComparisonResult)kp_compare:(NSString *)string;
- (NSComparisonResult)kp_compare:(NSString *)string option:(NSStringCompareOptions)option;
- (NSComparisonResult)kp_compareNumberic:(NSString *)numbericString;

@end
