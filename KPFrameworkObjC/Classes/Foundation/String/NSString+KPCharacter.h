//
//  NSString+KPCharacter.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (KPCharacter)

/**
 基本类型转换为string
 */
+ (NSString *)kp_intString:(int)num;
+ (NSString *)kp_integerString:(NSInteger)num;
+ (NSString *)kp_longString:(long)num;
+ (NSString *)kp_longLongString:(long long)num;
+ (NSString *)kp_floatString:(float)num;
+ (NSString *)kp_doubleString:(double)num;
+ (NSString *)kp_BOOLString:(BOOL)num;

/**
 其他UI相关结构体转换
 */
+ (NSString *)kp_CGRectString:(CGRect)rect;
+ (NSString *)kp_CGPointString:(CGPoint)point;
+ (NSString *)kp_CGSizeString:(CGSize)size;
+ (NSString *)kp_rangeString:(NSRange)range;
- (CGRect)kp_CGRect;
- (CGPoint)kp_CGPoint;
- (CGSize)kp_CGSize;
- (NSRange)kp_range;

/**
 是否为汉字
 */
- (BOOL)kp_isChineseCharacter;

/**
 是否为英文字母
 */
- (BOOL)kp_isLetterCharacter;

/**
 是否为数字
 */
- (BOOL)kp_isNumber;

@end
