//
//  NSString+KPPhone.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 手机相关
 */
@interface NSString (KPPhone)

/**
 * 验证手机号码有效性
 *
 * 手机号码
 * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
 * 联通：130,131,132,152,155,156,185,186
 * 电信：133,1349,153,180,189
 *
 * 中国移动：China Mobile
 * 134[0-8],135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,178(4G),147
 *
 * 中国联通：China Unicom
 * 130,131,132,145,155,156,185,186,176(4G)
 *
 * 中国电信：China Telecom
 * 133,1349,153,180,181,189,177(4G)
 *
 *  虚拟运营商
 *  170,171,172,173,174,175,176,177,178,179
 */
- (BOOL)kp_isPhoneNumber;

/**
 去掉用于显示的无效的符号.+86 和 -
 */
- (NSString *)kp_absolutePhoneNumber;

/**
 如果是11位，则隐藏中间4位 138****5164
 其他情况全部隐藏
 */
- (NSString *)kp_secretPhoneNumber;

@end
