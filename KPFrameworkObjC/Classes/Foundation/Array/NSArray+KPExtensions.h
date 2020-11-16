//
//  NSArray+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^kpArrayValueSelector)(id object);
typedef id(^kpArrayIndexValueSelector)(int index, id object);
typedef BOOL(^kpArrayValueCondition)(id object);

/**
 基础部分
 */
@interface NSArray (KPExtensions)

/**
 是否包含
 */
- (BOOL)kp_contain:(id)object;

/**
 遍历
 */
- (void)kp_each:(kpArrayValueSelector NS_NOESCAPE)expression;
- (void)kp_eachWithIndex:(kpArrayIndexValueSelector NS_NOESCAPE)expression;

/**
 如果返回nil则不加入
 */
- (NSArray *)kp_map:(kpArrayValueSelector NS_NOESCAPE)expression;

/**
 只要有一个符合条件,返回yes
 */
- (BOOL)kp_or:(kpArrayValueCondition NS_NOESCAPE)expression;

/**
 所有的符合条件,返回yes
 */
- (BOOL)kp_and:(kpArrayValueCondition NS_NOESCAPE)expression;

/**
 获取元素
 */
- (id)kp_firstObject;
- (id)kp_lastObject;

/**
 如果没有符合标准的,则返回nil
 */
- (id)kp_find:(kpArrayValueCondition NS_NOESCAPE)expression;
/**
 如果没有object,则返回nil
 */
- (id)kp_findObject:(id)object;

/**
 获取指定部分的数组
 */
- (NSArray *)kp_take:(int)count;
- (NSArray *)kp_takeWhile:(kpArrayValueCondition NS_NOESCAPE)expression;
- (NSArray *)kp_skip:(int)count;

/**
 过滤数据
 */
- (NSArray *)kp_filter:(kpArrayValueCondition NS_NOESCAPE)expression;
- (NSArray *)kp_filterWithinClass:(Class)class1;
- (NSArray *)kp_filterWithoutClass:(Class)class1;
- (NSArray *)kp_filterWithoutNSNull;

/**
 保留指定的数据
 */
- (NSArray *)kp_filterWithin:(NSArray *)array;

/**
 过滤掉指定的数据
 */
- (NSArray *)kp_filterWithout:(NSArray *)array;

/**
 去掉重复数据
 */
- (NSArray *)kp_distinct;

/**
 componentsJoinedByString
 */
- (NSString *)kp_join:(NSString *)join;

/**
 arrayByAddingObjectsFromArray
 */
- (NSArray *)kp_concat:(NSArray *)array;

/**
 排序
 */
- (NSArray *)kp_sort;
- (NSArray *)kp_sortBy:(NSString *)keyPath;
- (NSArray *)kp_descendBy:(NSString *)keyPath;
- (NSArray *)kp_sort:(NSComparator NS_NOESCAPE)compare;
- (NSArray *)kp_reverse;

/**
 子对象也同样生成可变集合
 */
- (NSMutableArray *)kp_mutableDeepCopy;

@end
