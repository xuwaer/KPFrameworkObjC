//
//  NSString+KPURL.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 net相关
 */
@interface NSString (KPURL)

/**
 URL格式有效性
 */
- (BOOL)kp_isURL;
- (BOOL)kp_isHttpURL;
// 对url无法识别的字符串进行转码.主要用于中文、特殊符号的转码
- (NSString *)kp_urlEncode;
- (NSString *)kp_urlDecode;

/**
 对string进行md5编码
 */
- (NSString *)kp_MD5;

/**
 uuid号,这个应该放在设备信息的类中
 // TODO
 */
- (NSString *)kp_UUID;

@end
