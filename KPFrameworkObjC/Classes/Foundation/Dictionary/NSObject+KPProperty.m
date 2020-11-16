//
//  NSObject+KPProperty.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/14.
//

#import "NSObject+KPProperty.h"
#import "KPGlobalMacro.h"
#import <objc/runtime.h>

@implementation NSObject (KPProperty)

/**
 生成proper的字典(如果property的值为nil，则字典中的值为NSNull)
 */
- (NSDictionary *)kp_properties
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:count];
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        [dict setValue:kpNilProtection([self valueForKey:key]) forKey:key];
    }
    free(properties);
    return dict;
}

@end
