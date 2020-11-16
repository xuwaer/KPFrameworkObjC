//
//  NSString+KPEmail.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 邮箱相关
 */
@interface NSString (KPEmail)

/**
 *  验证邮箱有效性
 */
- (BOOL)kp_isEmail;

@end
