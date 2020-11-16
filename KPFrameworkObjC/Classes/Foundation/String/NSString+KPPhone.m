//
//  NSString+KPPhone.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPPhone.h"
#import "NSString+KPExtensions.h"
#import "NSString+KPSubString.h"
#import "NSArray+KPExtensions.h"

@implementation NSString (KPPhone)
/**
 *  验证手机号码有效性
 */
- (BOOL)kp_isPhoneNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,178(4G),147
     */
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[0127-9]|8[23478]|78|47)\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,185,186,176(4G)
     */
    //    NSString * CU = @"^1(3[0-2]|45|5[256]|8[56])\\d{8}$";
    NSString * CU = @"^1(3[0-2]|45|5[56]|8[56]|76)\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,181,189,177(4G)
     */
    //    NSString * CT = @"^1((33|53|8[019])[0-9]|349|(70[059]))\\d{7}$";
    NSString * CT = @"^1((33|53|8[019]|77)[0-9]|349|(70[059]))\\d{7}$";
    /**
     *  虚拟运营商及其他新增号段
     *  170、166、198、199
     */
    NSString * VT = @"^1((6|7|9)[0-9])\\d{8}$";
    
    return [@[MOBILE, CM, CU, CT, VT] kp_or:^BOOL(id object) {
        return [self kp_match:object];
    }];
}

/**
 去掉用于显示的无效的符号.+86 和 -
 */
- (NSString *)kp_absolutePhoneNumber
{
    NSString *phone = [self kp_remove:@"("];
    phone = [phone kp_remove:@")"];
    phone = [phone kp_remove:@"（"];
    phone = [phone kp_remove:@"）"];
    phone = [phone kp_remove:@"-"];
    phone = [phone kp_remove:@"+86"];
    phone = [phone kp_remove:@" "];
    return phone;
}

/**
 隐藏中间4位
 138****5164
 */
- (NSString *)kp_secretPhoneNumber
{
    NSString *phone = [self kp_absolutePhoneNumber];
    if (phone.length < 11) return @"****";
    return [phone kp_replaceRange:NSMakeRange(3, 4) with:@"****"];
}

@end
