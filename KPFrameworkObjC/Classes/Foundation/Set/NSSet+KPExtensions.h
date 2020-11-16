//
//  NSSet+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/21.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^kpSetValueSelector)(id object);
typedef BOOL(^kpSetValueCondition)(id object);

@interface NSSet (KPExtensions)

/**
 遍历
 */
- (void)kp_each:(kpSetValueSelector NS_NOESCAPE)expression;

/**
 如果返回nil则不加入
 */
- (NSSet *)kp_map:(kpSetValueSelector NS_NOESCAPE)expression;

/**
 只要有一个符合条件,返回yes
 */
- (BOOL)kp_or:(kpSetValueCondition NS_NOESCAPE)expression;

/**
 所有的符合条件,返回yes
 */
- (BOOL)kp_and:(kpSetValueCondition NS_NOESCAPE)expression;

/**
 如果没有object,则返回nil
 */
- (id)kp_find:(id)object;

/**
 过滤数据
 */
- (NSSet *)kp_filter:(kpSetValueCondition NS_NOESCAPE)expression;
- (NSSet *)kp_filterWithinClass:(Class)class1;
- (NSSet *)kp_filterWithoutClass:(Class)class1;
- (NSSet *)kp_filterWithoutNSNull;

/**
 保留指定的数据
 */
- (NSSet *)kp_filterWithin:(NSArray *)array;

/**
 过滤掉指定的数据
 */
- (NSSet *)kp_filterWithout:(NSArray *)array;

/**
 排序
 */
- (NSArray *)kp_sortBy:(NSString *)key;
- (NSArray *)kp_descendBy:(NSString *)key;

/**
 子对象也同样生成可变集合
 */
- (NSMutableSet *)kp_mutableDeepCopy;

@end
