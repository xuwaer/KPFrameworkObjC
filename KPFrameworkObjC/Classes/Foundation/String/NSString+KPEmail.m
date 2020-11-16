//
//  NSString+KPEmail.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPEmail.h"
#import "NSString+KPExtensions.h"

@implementation NSString (KPEmail)

/**
 *  验证邮箱有效性
 */
- (BOOL)kp_isEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]{1,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self kp_match:regex];
}

@end
