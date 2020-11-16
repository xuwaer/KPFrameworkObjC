//
//  NSMutableArray+KPQueue.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSMutableArray+KPQueue.h"

@implementation NSMutableArray (KPQueue)

+ (instancetype)kp_queue
{
    return [self new];
}

- (void)kp_enQueue:(id)object
{
    [self addObject:object];
}

- (id)kp_deQueue
{
    id object = [self firstObject];
    if (self.count > 0)
        [self removeObjectAtIndex:0];
    return object;
}

- (NSArray *)kp_deQueue:(NSUInteger)numberOfElements
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:numberOfElements];
    for (NSUInteger i = 0; i < numberOfElements; i++)
        [array insertObject:[self kp_deQueue] atIndex:0];
    return array;
}

- (NSArray *)kp_deQueueAll
{
    return [self kp_deQueue:self.count];
}

- (id)kp_peek:(NSUInteger)index
{
    if (self.count >= index + 1) {
        return [self objectAtIndex:index];
    }
    else {
        return nil;
    }
}

- (id)kp_peekHead
{
    return [self firstObject];
}

- (id)kp_peekTrail
{
    return [self lastObject];
}

@end
