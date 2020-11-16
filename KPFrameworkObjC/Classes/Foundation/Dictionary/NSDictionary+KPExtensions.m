//
//  NSDictionary+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/30.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSDictionary+KPExtensions.h"
#import "NSMutableDictionary+KPExtensions.h"

@implementation NSDictionary (KPExtensions)

/**
 遍历
 */
- (void)kp_each:(kpDictionaryKeyValueSelector)expression
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        expression(key, obj);
    }];
}

- (void)kp_eachKey:(kpDictionaryValueSelector)expression
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        expression(key);
    }];
}

- (void)kp_eachValue:(kpDictionaryValueSelector)expression
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        expression(obj);
    }];
}

- (NSArray *)kp_map:(kpDictionaryKeyValueSelector)expression
{
    NSMutableArray *array = [NSMutableArray new];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id result = expression(key, obj);
        if (result) [array addObject:result];
    }];
    return array;
}

/**
 只要有一个符合条件,返回yes
 */
- (BOOL)kp_or:(kpDictionaryKeyValueCondition)expression
{
    __block BOOL result = NO;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (expression(key, obj)) {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}

/**
 所有的符合条件,返回yes
 */
- (BOOL)kp_and:(kpDictionaryKeyValueCondition)expression
{
    __block BOOL result = YES;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (!expression(key, obj)) {
            result = NO;
            *stop = YES;
        }
    }];
    return result;
}

/**
 合并
 */
- (NSDictionary *)kp_merge:(NSDictionary *)dictionary
{
    NSMutableDictionary* result = [[NSMutableDictionary alloc] initWithDictionary:self];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![result objectForKey:key]) {
            [result setObject:obj forKey:key];
        }
    }];
    return result;
}

/**
 替换
 */
- (NSDictionary *)kp_replace:(id)value forKey:(id)key
{
    NSMutableDictionary *newDic = [self mutableCopy];
    if (value == nil) [newDic removeObjectForKey:key];
    else [newDic setValue:value forKey:key];
    return newDic;
}

- (NSDictionary *)kp_replaceValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
    NSMutableDictionary *dict = [self mutableCopy];
    NSArray *allkeys = keyedValues.allKeys;
    for (NSString *key in allkeys) {
        [dict kp_setNNilValue:keyedValues[key] forKey:key];
    }
    return dict;
}

/**
 移除key
 */
- (NSDictionary *)kp_removeFor:(id)key
{
    NSMutableDictionary *dic = [self mutableCopy];
    [dic removeObjectForKey:key];
    return dic;
}

/**
 排序
 */
- (NSArray *)kp_sortKeys
{
    return [self keysSortedByValueUsingSelector:@selector(compare:)];
}

- (NSArray *)kp_sortKeys:(NSComparator NS_NOESCAPE)compare
{
    return [self keysSortedByValueUsingComparator:compare];
}

/**
 添加值
 */
- (NSDictionary *)kp_setValue:(id)value forKey:(NSString *)key
{
    NSMutableDictionary *dic = [self mutableCopy];
    [dic kp_setNNilValue:value forKey:key];
    return dic;
}

- (NSDictionary *)kp_setValue:(id)value forKeyPath:(NSString *)keyPath
{
    NSMutableDictionary *dic = [self mutableCopy];
    [dic kp_setNNilValue:value forKeyPath:keyPath];
    return dic;
}

/**
 子对象也同样生成可变集合
 */
- (NSMutableDictionary *)kp_mutableDeepCopy
{
    NSMutableDictionary * returnDict = [[NSMutableDictionary alloc] initWithCapacity:self.count];
    NSArray * keys = [self allKeys];
    
    for(id key in keys) {
        id oneValue = [self objectForKey:key];
        id oneCopy = nil;
        
        if([oneValue respondsToSelector:@selector(kp_mutableDeepCopy)]) {
            oneCopy = [oneValue kp_mutableDeepCopy];
        } else if([oneValue conformsToProtocol:@protocol(NSMutableCopying)]) {
            oneCopy = [oneValue mutableCopy];
        } else if([oneValue conformsToProtocol:@protocol(NSCopying)]){
            oneCopy = [oneValue copy];
        } else {
            oneCopy = oneValue;
        }
        [returnDict setValue:oneCopy forKey:key];
    }
    return returnDict;
}

/**
 过滤数据
 */
- (NSDictionary *)kp_filter:(kpDictionaryKeyValueCondition)expression
{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (expression(key, obj)) [dic setObject:obj forKey:key];
    }];
    return dic;
}

- (NSDictionary *)kp_filterWithinClass:(Class)class1
{
    return [self kp_filter:^BOOL(id key, id value) {
        return [value isKindOfClass:class1];
    }];
}

- (NSDictionary *)kp_filterWithoutClass:(Class)class1
{
    return [self kp_filter:^BOOL(id key, id value) {
        return ![value isKindOfClass:class1];
    }];
}

- (NSDictionary *)kp_filterWithoutNSNull
{
    return [self kp_filterWithoutClass:NSNull.class];
}

@end
