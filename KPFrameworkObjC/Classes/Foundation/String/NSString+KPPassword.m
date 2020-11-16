//
//  NSString+KPPassword.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPPassword.h"
#import "NSString+KPExtensions.h"

@implementation NSString (KPPassword)

/**
 *  验证密码有效性,指定密码的最小和最大长度.默认6~12位
 */
- (BOOL)kp_isPassword6To16
{
    return [self kp_isPasswordByMinLength:6 maxLength:16];
}

- (BOOL)kp_isPasswordByMinLength:(NSUInteger)minlength maxLength:(NSUInteger)maxlength
{
    NSString *regex = [NSString stringWithFormat:@"^[A-Za-z0-9]{%lu,%lu}+$", (unsigned long)minlength, (unsigned long)maxlength];
    return [self kp_match:regex];
}

@end
