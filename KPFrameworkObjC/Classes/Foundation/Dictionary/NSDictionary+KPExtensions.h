//
//  NSDictionary+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/30.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^kpDictionaryKeyValueSelector)(id key, id value);
typedef id(^kpDictionaryValueSelector)(id value);
typedef BOOL(^kpDictionaryKeyValueCondition)(id key, id value);

/**
 基础部分
 */
@interface NSDictionary (KPExtensions)

/**
 遍历
 */
- (void)kp_each:(kpDictionaryKeyValueSelector NS_NOESCAPE)expression;
- (void)kp_eachKey:(kpDictionaryValueSelector NS_NOESCAPE)expression;
- (void)kp_eachValue:(kpDictionaryValueSelector NS_NOESCAPE)expression;

/**
 如果返回nil则不加入
 */
- (NSArray *)kp_map:(kpDictionaryKeyValueSelector NS_NOESCAPE)expression;

/**
 只要有一个符合条件,返回yes
 */
- (BOOL)kp_or:(kpDictionaryKeyValueCondition NS_NOESCAPE)expression;

/**
 所有的符合条件,返回yes
 */
- (BOOL)kp_and:(kpDictionaryKeyValueCondition NS_NOESCAPE)expression;

/**
 合并
 */
- (NSDictionary *)kp_merge:(NSDictionary *)dictionary;

/**
 替换
 */
- (NSDictionary *)kp_replace:(id)value forKey:(id)key;
- (NSDictionary *)kp_replaceValuesForKeysWithDictionary:(NSDictionary *)keyedValues;

/**
 移除key
 */
- (NSDictionary *)kp_removeFor:(id)key;

/**
 排序
 */
- (NSArray *)kp_sortKeys;
- (NSArray *)kp_sortKeys:(NSComparator NS_NOESCAPE)compare;

/**
 添加值
 */
- (NSDictionary *)kp_setValue:(id)value forKey:(NSString *)key;
- (NSDictionary *)kp_setValue:(id)value forKeyPath:(NSString *)keyPath;

/**
 子对象也同样生成可变集合
 */
- (NSMutableDictionary *)kp_mutableDeepCopy;


/**
 过滤数据
 */
- (NSDictionary *)kp_filter:(kpDictionaryKeyValueCondition NS_NOESCAPE)expression;
- (NSDictionary *)kp_filterWithinClass:(Class)class1;
- (NSDictionary *)kp_filterWithoutClass:(Class)class1;
- (NSDictionary *)kp_filterWithoutNSNull;

@end
