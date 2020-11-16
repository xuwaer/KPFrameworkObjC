//
//  KPDebugMacro.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

// 日志

// debug相关常量
#define kpThisMethod            NSStringFromSelector(_cmd)
#define kpThisFile              [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String]


// 控制台日志
#ifdef DEBUG
#define kpDebugLog( s, ... )     NSLog(@"\n<%s:%d>\n%s", \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
__LINE__, \
[[NSString stringWithFormat:s, ##__VA_ARGS__] UTF8String] )
#else
#define kpDebugLog( s, ... )
#endif

// 弹框类日志
#ifdef DEBUG
#define kpAlertLog(fmt, ...)      { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"<%s:%d>", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#define kpAlertLog(...)
#endif

// 抛出异常
#define kpThrowException(name, reason)        @throw [NSException exceptionWithName:name reason:reason userInfo:nil]


// 去掉leak警告
#define kpIgnoreLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)
