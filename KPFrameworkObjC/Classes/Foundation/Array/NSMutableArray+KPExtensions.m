//
//  NSMutableArray+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSMutableArray+KPExtensions.h"
#import "NSArray+KPExtensions.h"

@implementation NSMutableArray (KPExtensions)

/**
 过滤掉nil
 */
- (void)kp_addNNilObject:(id)anObject
{
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) return;
    [self addObject:anObject];
}

- (void)kp_addNNilObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray == nil || [otherArray isKindOfClass:NSNull.class]) return;
    [self addObjectsFromArray:otherArray];
}

- (void)kp_insertNNilObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) return;
    if (index >= self.count) return;
    [self insertObject:anObject atIndex:index];
}

- (void)kp_insertNNilObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    if (objects == nil) return;
    [self insertObjects:objects atIndexes:indexes];
}

- (void)kp_removeNNilObject:(id)anObject
{
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) return;
    [self removeObject:anObject];
}

- (void)kp_removeNNilObject:(id)anObject inRange:(NSRange)range
{
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) return;
    [self removeObject:anObject inRange:range];
}

- (void)kp_removeNNilObjectsInArray:(NSArray *)otherArray
{
    if (otherArray == nil || [otherArray isKindOfClass:NSNull.class]) return;
    [self removeObjectsInArray:otherArray];
}

- (void)kp_removeLast
{
    [self removeLastObject];
}

- (void)kp_removeFirst
{
    if (self.count <= 0) return;
    [self removeObjectAtIndex:0];
}

// 替换
- (void)kp_replaceAtIndex:(NSUInteger)index withNNilObject:(id)anObject
{
    if (index < 0 || self.count <= index) return;
    if (anObject == nil || [anObject isKindOfClass:NSNull.class]) return;
    [self replaceObjectAtIndex:index withObject:anObject];
}

- (void)kp_replaceLastWithNNilObject:(id)anObject
{
    [self kp_replaceAtIndex:self.count - 1 withNNilObject:anObject];
}

- (void)kp_replaceFirstWithNNilObject:(id)anObject
{
    [self kp_replaceAtIndex:0 withNNilObject:anObject];
}

/**
 过滤掉nil，返回self
 */
- (NSMutableArray *)kp_addObject:(id)anObj
{
    [self kp_addNNilObject:anObj];
    return self;
}

- (NSMutableArray *)kp_addObjectsFromArray:(NSArray *)otherArray
{
    [self kp_addNNilObjectsFromArray:otherArray];
    return self;
}

- (NSMutableArray *)kp_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    [self kp_insertNNilObject:anObject atIndex:index];
    return self;
}

- (NSMutableArray *)kp_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    [self kp_insertNNilObjects:objects atIndexes:indexes];
    return self;
}

- (NSMutableArray *)kp_removeObject:(id)anObject
{
    [self kp_removeNNilObject:anObject];
    return self;
}

- (NSMutableArray *)kp_removeObject:(id)anObject inRange:(NSRange)range
{
    [self kp_removeNNilObject:anObject inRange:range];
    return self;
}

- (NSMutableArray *)kp_removeObjectsInArray:(NSArray *)otherArray
{
    [self kp_removeNNilObjectsInArray:otherArray];
    return self;
}

@end
