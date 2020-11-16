//
//  NSString+KPJSON.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KPJSON)

/**
 如果是jsonString,则转换为json object
 */
- (id)kp_jsonObject;
- (id)kp_jsonMutableObject;

@end
