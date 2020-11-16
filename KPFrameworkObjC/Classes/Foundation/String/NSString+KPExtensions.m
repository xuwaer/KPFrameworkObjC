//
//  NSString+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPExtensions.h"

@implementation NSString (KPExtensions)

/**
 当前时间+0~100的随机数
 */
+ (NSString *)kp_random
{
    NSString *key = [@((long long)([NSDate date].timeIntervalSince1970 * 1000)) stringValue];
    int random = arc4random() % 100;
    return [NSString stringWithFormat:@"%@%@", [@(random) stringValue], key];
}

/**
 文字的匹配度。通过正则表达式判断
 */
- (BOOL)kp_match:(NSString *)regex
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/**
 去掉首尾空格和换行
 */
- (NSString *)kp_trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 切割
 */
- (NSArray *)kp_split:(NSString *)seperator
{
    return [self componentsSeparatedByString:seperator];
}

+ (NSString *)kp_empty
{
    return @"";
}

- (BOOL)kp_isEmpty
{
    return self.length > 0;
}

/**
 文字大小计算
 */
- (CGSize)kp_sizeWithFont:(UIFont *)font limitSize:(CGSize)limit
{
    NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGSize stringSize = [self boundingRectWithSize:limit options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return stringSize;
}

/**
 比较
 */
- (NSComparisonResult)kp_compare:(NSString *)string
{
    return [self compare:string];
}

- (NSComparisonResult)kp_compare:(NSString *)string option:(NSStringCompareOptions)option
{
    return [self compare:string options:option];
}

/**
 数值类型比较
 e.g. "3.0.1" > "2.8.5", "3.0" > "2.8"
 */
- (NSComparisonResult)kp_compareNumberic:(NSString *)numbericString
{
    return [self compare:numbericString options:NSNumericSearch];
}

@end
