//
//  NSMutableArray+KPQueue.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 队列
 */
@interface NSMutableArray (KPQueue)

/**
 创建队列
 */
+ (instancetype)kp_queue;

/**
 加入队列
 */
- (void)kp_enQueue:(id)object;

/**
 移除队列
 */
- (id)kp_deQueue;

/**
 移除指定数量的队列
 */
- (NSArray *)kp_deQueue:(NSUInteger)numberOfElements;

/**
 所有元素移除队列
 */
- (NSArray *)kp_deQueueAll;

/**
 获取指定位置的值
 */
- (id)kp_peek:(NSUInteger)index;
- (id)kp_peekHead;
- (id)kp_peekTrail;

@end
