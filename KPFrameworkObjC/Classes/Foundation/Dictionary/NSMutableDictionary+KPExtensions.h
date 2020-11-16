//
//  NSMutableDictionary+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (KPExtensions)

/**
 过滤掉nil值
 */
- (void)kp_setNNilValue:(id)value forKey:(NSString *)key;
- (void)kp_setNNilValue:(id)value forKeyPath:(NSString *)keyPath;
- (void)kp_setNNilObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)kp_setNNilObject:(id)obj forKeyedSubscript:(id<NSCopying>)key;
- (void)kp_setNNilValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues;


/**
 过滤掉nil，返回self
 */
- (NSMutableDictionary *)kp_setValue:(id)value forKey:(NSString *)key;
- (NSMutableDictionary *)kp_setValue:(id)value forKeyPath:(NSString *)keyPath;
- (NSMutableDictionary *)kp_setObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (NSMutableDictionary *)kp_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key;
- (NSMutableDictionary *)kp_setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues;

// 如果keypath不存在，则完善并生成子结构，使用字典类型@{}
- (NSMutableDictionary *)kp_setOrCompleteObject:(id)object forKeyPath:(NSString *)keyPath;

@end
