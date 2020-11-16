//
//  NSMutableArray+KPStack.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 堆栈
 */
@interface NSMutableArray (KPStack)

/**
 创建栈
 */
+ (instancetype)kp_stack;

/**
 栈操作
 */
- (id)kp_pop;
- (NSArray *)kp_pop:(NSUInteger)numberOfElements;
- (NSArray *)kp_popAll;

- (void)kp_push:(id)object;

- (id)kp_top;
- (id)kp_bottom;

@end
