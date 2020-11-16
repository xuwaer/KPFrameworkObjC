//
//  NSError+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSError+KPExtensions.h"
#import "KPGlobalMacro.h"
#import "KPDeviceMacro.h"

@implementation NSError (KPExtensions)

+ (instancetype)kp_errorWithCode:(NSInteger)code message:(NSString *)message
{
    return [self errorWithDomain:kpAppBundleID code:code userInfo:@{NSLocalizedDescriptionKey: kpNNilString(message)}];
}

- (NSString *)kp_message
{
    return self.userInfo ? self.userInfo[NSLocalizedDescriptionKey] : @"未知错误";
}

@end
