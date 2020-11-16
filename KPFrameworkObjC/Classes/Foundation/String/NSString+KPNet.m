//
//  NSString+KPURL.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPNet.h"
#import "NSString+KPSubString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (KPURL)

/**
 URL格式有效性
 */
- (BOOL)kp_isURL
{
    return [NSURL URLWithString:self] != nil;
}

- (BOOL)kp_isHttpURL
{
    return [self kp_isURL] && ([[self lowercaseString] kp_indexOf:@"http://"] != NSNotFound || [[self lowercaseString] kp_indexOf:@"https://"] != NSNotFound);
}

// 对url无法识别的字符串进行转码.主要用于中文、特殊符号的转码
- (NSString *)kp_urlEncode
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)kp_urlDecode
{
    return [self stringByRemovingPercentEncoding];
}

/**
 对string进行md5编码
 */
- (NSString *)kp_MD5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int) strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 uuid号,这个应该放在设备信息的类中
 // TODO
 */
- (NSString *)kp_UUID
{
    CFUUIDRef	uuidObj = CFUUIDCreate(nil);
    NSString	*uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return uuidString;
}

@end
