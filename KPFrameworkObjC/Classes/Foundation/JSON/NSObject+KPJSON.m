//
//  NSObject+KPJSON.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSObject+KPJSON.h"

@implementation NSObject (KPJSON)

/**
 object 转换成 json
 */
- (NSString *)kp_jsonString
{
    NSData *data = [self kp_jsonData];
    NSString *jsonString = nil;
    if (data != nil) jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (NSData *)kp_jsonData
{
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

@end
