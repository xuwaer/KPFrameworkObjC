//
//  NSMutableDictionary+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSMutableDictionary+KPExtensions.h"

@implementation NSMutableDictionary (KPExtensions)

/**
 过滤掉nil值
 */
- (void)kp_setNNilValue:(id)value forKey:(NSString *)key
{
    if (key == nil || key.length <= 0) return;
    if (value == nil || [value isKindOfClass:NSNull.class]) return;
    [self setValue:value forKey:key];
}

- (void)kp_setNNilValue:(id)value forKeyPath:(NSString *)keyPath
{
    if (keyPath == nil || keyPath.length <= 0) return;
    if (value == nil || [value isKindOfClass:NSNull.class]) return;
    [self setValue:value forKeyPath:keyPath];
}

- (void)kp_setNNilObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (aKey == nil) return;
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) return;
    [self setObject:anObject forKey:aKey];
}

- (void)kp_setNNilObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
    if (key == nil) return;
    if (obj == nil || [obj isKindOfClass:NSNull.class]) return;
    [self setObject:obj forKeyedSubscript:key];
}

- (void)kp_setNNilValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    if (keyedValues == nil || [keyedValues isKindOfClass:NSNull.class]) return;
    [self setValuesForKeysWithDictionary:keyedValues];
}


/**
 过滤掉nil，返回self
 */
- (NSMutableDictionary *)kp_setValue:(id)value forKey:(NSString *)key
{
    [self kp_setNNilValue:value forKey:key];
    return self;
}

- (NSMutableDictionary *)kp_setValue:(id)value forKeyPath:(NSString *)keyPath
{
    [self kp_setNNilValue:value forKeyPath:keyPath];
    return self;
}

- (NSMutableDictionary *)kp_setObject:(id)anObject forKey:(id<NSCopying>)aKey;
{
    [self kp_setNNilObject:anObject forKey:aKey];
    return self;
}

- (NSMutableDictionary *)kp_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
    [self kp_setNNilObject:obj forKeyedSubscript:key];
    return self;
}

- (NSMutableDictionary *)kp_setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    [self kp_setNNilValuesForKeysWithDictionary:keyedValues];
    return self;
}

- (NSMutableDictionary *)kp_setOrCompleteObject:(id)object forKeyPath:(NSString *)keyPath
{
    NSArray *tmp = [keyPath componentsSeparatedByString:@"."];
    NSString *realKey = [tmp lastObject];
    NSMutableDictionary *dic = self;
    for (NSString *key in tmp) {
        id value = dic[key];
        
        // no this key or it's a dictionary
        if (!value || [[value class] isSubclassOfClass:NSDictionary.class]) {
            if (!value) value = @{};
            // add or change to mutable
            value = [NSMutableDictionary dictionaryWithDictionary:value];
            dic[key] = value;
        }
        
        if (key == realKey) {
            [dic setObject:object forKey:realKey];
        }
        else{
            // replace
            dic = value;
            // go to inner layer
        }
    }
    return dic;
}

@end
