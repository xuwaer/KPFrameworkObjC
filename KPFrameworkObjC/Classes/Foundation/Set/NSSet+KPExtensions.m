//
//  NSSet+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/21.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSSet+KPExtensions.h"

@implementation NSSet (KPExtensions)

/**
 遍历
 */
- (void)kp_each:(kpSetValueSelector NS_NOESCAPE)expression
{
    for (id obj in self.allObjects) {
        expression(obj);
    }
}

/**
 如果返回nil则不加入
 */
- (NSSet *)kp_map:(kpSetValueSelector NS_NOESCAPE)expression
{
    NSMutableSet *set = [NSMutableSet new];
    for (id object in self.allObjects) {
        id result = expression(object);
        if (result) [set addObject:result];
    }
    return set;
}

/**
 只要有一个符合条件,返回yes
 */
- (BOOL)kp_or:(kpSetValueCondition NS_NOESCAPE)expression
{
    for (id object in self.allObjects) {
        if (expression(object)) return YES;
    }
    return NO;
}

/**
 所有的符合条件,返回yes
 */
- (BOOL)kp_and:(kpSetValueCondition NS_NOESCAPE)expression
{
    for (id object in self.allObjects) {
        if (!expression(object)) return NO;
    }
    return YES;
}

/**
 如果没有object,则返回nil
 */
- (id)kp_find:(id)object
{
    if ([self containsObject:object])
        return object;
    else
        return nil;
}

/**
 过滤数据
 */
- (NSSet *)kp_filter:(kpSetValueCondition NS_NOESCAPE)expression
{
    NSMutableSet *set = [NSMutableSet new];
    for (id object in self.allObjects) {
        if (expression(object)) [set addObject:object];
    }
    return set;
}

- (NSSet *)kp_filterWithinClass:(Class)class1
{
    return [self kp_filter:^BOOL(id object) {
        return [object isKindOfClass:class1];
    }];
}

- (NSSet *)kp_filterWithoutClass:(Class)class1
{
    return [self kp_filter:^BOOL(id object) {
        return ![object isKindOfClass:class1];
    }];
}

- (NSSet *)kp_filterWithoutNSNull
{
    return [self kp_filterWithoutClass:NSNull.class];
}

/**
 保留指定的数据
 */
- (NSSet *)kp_filterWithin:(NSArray *)array
{
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"SELF IN %@", array];
    return [self filteredSetUsingPredicate:intersectPredicate];
}

/**
 过滤掉指定的数据
 */
- (NSSet *)kp_filterWithout:(NSArray *)array
{
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"NOT SELF IN %@", array];
    return [self filteredSetUsingPredicate:intersectPredicate];
}

/**
 排序
 */
- (NSArray *)kp_sortBy:(NSString *)key
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:YES];
    return [self sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (NSArray *)kp_descendBy:(NSString *)key
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:NO];
    return [self sortedArrayUsingDescriptors:@[sortDescriptor]];
}

/**
 子对象也同样生成可变集合
 */
- (NSMutableSet *)kp_mutableDeepCopy
{
    NSMutableSet * returnValue = [[NSMutableSet alloc] initWithCapacity:self.count];
    
    for(id obj in self.allObjects) {
        id oneValue = obj;
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
        [returnValue addObject:oneCopy];
    }
    return returnValue;
}

@end
