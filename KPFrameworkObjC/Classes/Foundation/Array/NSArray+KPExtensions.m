//
//  NSArray+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSArray+KPExtensions.h"

@implementation NSArray (KPExtensions)

- (BOOL)kp_contain:(id)object
{
    return [self containsObject:object];
}

/**
 遍历
 */
- (void)kp_each:(kpArrayValueSelector)expression
{
    for (id object in self) {
        expression(object);
    }
}

- (void)kp_eachWithIndex:(kpArrayIndexValueSelector)expression
{
    for (int i = 0; i < self.count; i++) {
        expression(i, self[i]);
    }
}

- (NSArray *)kp_map:(kpArrayValueSelector)expression
{
    NSMutableArray *array = [NSMutableArray new];
    for (id object in self) {
        id result = expression(object);
        if (result) [array addObject:result];
    }
    return array;
}

/**
 只要有一个符合条件,返回yes
 */
- (BOOL)kp_or:(kpArrayValueCondition)expression
{
    for (id object in self) {
        if (expression(object)) return YES;
    }
    return NO;
}

/**
 所有的符合条件,返回yes
 */
- (BOOL)kp_and:(kpArrayValueCondition)expression
{
    for (id object in self) {
        if (!expression(object)) return NO;
    }
    return YES;
}

/**
 元素获取
 */
- (id)kp_firstObject
{
    return self.firstObject;
}

- (id)kp_lastObject
{
    return self.lastObject;
}

/**
 如果没有符合标准的,则返回nil
 */
- (id)kp_find:(kpArrayValueCondition NS_NOESCAPE)expression
{
    for (id object in self) {
        if (expression(object)) return object;
    }
    return nil;
}

/**
 如果没有object,则返回nil
 */
- (id)kp_findObject:(id)object
{
    if ([self containsObject:object])
        return object;
    else
        return nil;
}

/**
 获取指定部分的数组
 */
- (NSArray *)kp_take:(int)count
{
    int arrayCount = MIN((int)self.count, count < 0 ? 0 : count);
    return [self subarrayWithRange:NSMakeRange(0, arrayCount)];
}

- (NSArray *)kp_takeWhile:(kpArrayValueCondition)expression
{
    return [self kp_filter:expression];
}

- (NSArray *)kp_skip:(int)count
{
    if (count < self.count) {
        NSRange range = {.location = count, .length = self.count - count};
        return [self subarrayWithRange:range];
    } else {
        return @[];
    }
}

/**
 过滤数据
 */
- (NSArray *)kp_filter:(kpArrayValueCondition)expression
{
    NSMutableArray *array = [NSMutableArray new];
    for (id object in self) {
        if (expression(object)) [array addObject:object];
    }
    return array;
}

- (NSArray *)kp_filterWithinClass:(Class)class1
{
    return [self kp_filter:^BOOL(id object) {
        return [object isKindOfClass:class1];
    }];
}

- (NSArray *)kp_filterWithoutClass:(Class)class1
{
    return [self kp_filter:^BOOL(id object) {
        return ![object isKindOfClass:class1];
    }];
}

- (NSArray *)kp_filterWithoutNSNull
{
    return [self kp_filterWithoutClass:NSNull.class];
}

- (NSArray *)kp_filterWithin:(NSArray *)array
{
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"SELF IN %@", array];
    return [self filteredArrayUsingPredicate:intersectPredicate];
}

- (NSArray *)kp_filterWithout:(NSArray *)array
{
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"NOT SELF IN %@", array];
    return [self filteredArrayUsingPredicate:intersectPredicate];
}

- (NSArray *)kp_distinct
{
    NSMutableSet *set = [NSMutableSet new];
    for (id object in self) {
        [set addObject:object];
    }
    return [set allObjects];
}

/**
 合并
 */
- (NSString *)kp_join:(NSString *)join
{
    return [self componentsJoinedByString:join];
}

- (NSArray *)kp_concat:(NSArray *)array
{
    NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:self.count + array.count];
    [result addObjectsFromArray:self];
    [result addObjectsFromArray:array];
    return result;
}

/**
 排序
 */
- (NSArray *)kp_sort
{
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)kp_sortBy:(NSString *)keyPath
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:keyPath ascending:YES];
    return [self sortedArrayUsingDescriptors:@[descriptor]];
}

- (NSArray *)kp_descendBy:(NSString *)keyPath
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:keyPath ascending:NO];
    return [self sortedArrayUsingDescriptors:@[descriptor]];
}

- (NSArray *)kp_sort:(NSComparator)compare
{
    return [self sortedArrayUsingComparator:compare];
}

- (NSArray *)kp_reverse
{
    return self.reverseObjectEnumerator.allObjects;
}

/**
 子对象也同样生成可变集合
 */
- (NSMutableArray *)kp_mutableDeepCopy
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:self.count];
    
    for(id oneValue in self) {
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
        
        [returnArray addObject:oneCopy];
    }
    return returnArray;
}
@end
