//
//  NSString+KPJSON.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPJSON.h"

@implementation NSString (KPJSON)

/**
 如果是jsonString,则转换为json object
 */
- (id)kp_jsonObject
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    else {
        return nil;
    }
}

- (id)kp_jsonMutableObject
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    }
    else {
        return nil;
    }
}

@end
