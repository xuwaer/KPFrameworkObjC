//
//  NSObject+KPJSON.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KPJSON)

/**
 object 转换成 json
 默认使用UTF8转换
 */
- (NSString *)kp_jsonString;
- (NSData *)kp_jsonData;

@end
