//
//  UIColor+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIColor+KPExtensions.h"

@implementation UIColor (KPExtensions)

+ (UIColor *)kp_colorWithRGBHex:(int32_t)hex
{
    return [self kp_colorWithRGBHex:hex alpha:1];
}

+ (UIColor *)kp_colorWithRGBHex:(int32_t)hex alpha:(float)alpha
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0 alpha:(alpha)];
}

+ (UIColor *)kp_colorWithRGBHexString:(NSString *)hexString
{
    return [self kp_colorWithRGBHexString:hexString alpha:1];
}

+ (UIColor *)kp_colorWithRGBHexString:(NSString *)hexString alpha:(float)alpha
{
    //删除字符串中的空格
    NSString *cString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0x if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([[cString lowercaseString] hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [cString substringWithRange:range];
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)kp_randomColor
{
    float r = arc4random() % 255 /  255.0;
    float g = arc4random() % 255 / 255.0;
    float b = arc4random() % 255 / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
