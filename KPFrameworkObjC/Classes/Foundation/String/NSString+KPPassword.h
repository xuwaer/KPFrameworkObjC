//
//  NSString+KPPassword.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 密码相关
 */
@interface NSString (KPPassword)

/**
 * 验证密码有效性,指定密码的最小和最大长度.默认6~12位
 * 仅含字母和数字
 */
- (BOOL)kp_isPassword6To16;
- (BOOL)kp_isPasswordByMinLength:(NSUInteger)minlength maxLength:(NSUInteger)maxlength;

@end
