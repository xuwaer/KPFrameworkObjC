//
//  NSMutableArray+KPStack.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSMutableArray+KPStack.h"

@implementation NSMutableArray (KPStack)

+ (instancetype)kp_stack
{
    return [self new];
}

- (id)kp_pop
{
    id result = self.lastObject;
    [self removeLastObject];
    return result;
}

- (NSArray *)kp_pop:(NSUInteger)numberOfElements
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:numberOfElements];
    for (NSUInteger i = 0; i < numberOfElements; i++)
        [array insertObject:[self kp_pop] atIndex:0];
    return array;
}

- (NSArray *)kp_popAll
{
    return [self kp_pop:self.count];
}


- (void)kp_push:(id)object
{
    [self addObject:object];
}

- (id)kp_top
{
    return self.lastObject;
}

- (id)kp_bottom
{
    return self.firstObject;
}

@end
