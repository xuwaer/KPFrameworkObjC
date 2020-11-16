//
//  NSNumber+KPSpace.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/21.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSNumber+KPSpace.h"

@implementation NSNumber (KPSpace)

/**
 控件大小 转换为人类可识别的字符串
 */
- (NSString *)kp_humanReadableSpaceSize
{
    double theSize = [self doubleValue];
    if (theSize == 0)
        return @"0 KB";
    if (theSize < 1023)
        return([NSString stringWithFormat:@"%lld Bytes", (long long)theSize]);
    theSize = theSize / 1024.0;
    if (theSize < 1023)
        return([NSString stringWithFormat:@"%1.1lf KB",theSize]);
    theSize = theSize / 1024.0;
    if (theSize < 1023)
        return([NSString stringWithFormat:@"%1.1lf MB",theSize]);
    theSize = theSize / 1024.0;
    
    return([NSString stringWithFormat:@"%1.1f GB",theSize]);
}

@end
