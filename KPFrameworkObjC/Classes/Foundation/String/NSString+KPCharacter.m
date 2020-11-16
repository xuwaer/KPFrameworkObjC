//
//  NSString+KPCharacter.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPCharacter.h"
#import "NSString+KPExtensions.h"

@implementation NSString (KPCharacter)

/**
 基本类型转换为string
 */
+ (NSString *)kp_intString:(int)num { return [@(num) stringValue]; }
+ (NSString *)kp_integerString:(NSInteger)num { return [@(num) stringValue]; }
+ (NSString *)kp_longString:(long)num { return [@(num) stringValue]; }
+ (NSString *)kp_longLongString:(long long)num { return [@(num) stringValue]; }
+ (NSString *)kp_floatString:(float)num { return [@(num) stringValue]; }
+ (NSString *)kp_doubleString:(double)num { return [@(num) stringValue]; }
+ (NSString *)kp_BOOLString:(BOOL)num { return [@(num) stringValue]; }

/**
 其他UI相关结构体转换为string
 */
+ (NSString *)kp_CGRectString:(CGRect)rect { return NSStringFromCGRect(rect); }
+ (NSString *)kp_CGPointString:(CGPoint)point { return NSStringFromCGPoint(point); }
+ (NSString *)kp_CGSizeString:(CGSize)size { return NSStringFromCGSize(size); }
+ (NSString *)kp_rangeString:(NSRange)range { return NSStringFromRange(range); }

- (CGRect)kp_CGRect { return CGRectFromString(self); }
- (CGPoint)kp_CGPoint { return CGPointFromString(self); }
- (CGSize)kp_CGSize { return CGSizeFromString(self); }
- (NSRange)kp_range { return NSRangeFromString(self); }

/**
 是否为汉字
 */
- (BOOL)kp_isChineseCharacter
{
    return [self kp_match:@"^[\u4E00-\u9FA5]+$"];
}

/**
 是否为英文字母
 */
- (BOOL)kp_isLetterCharacter
{
    return [self kp_match:@"^[A-Za-z]+$"];
}

/**
 是否为数字
 */
- (BOOL)kp_isNumber
{
    return [self kp_match:@"^[0-9]+$"];
}

@end
