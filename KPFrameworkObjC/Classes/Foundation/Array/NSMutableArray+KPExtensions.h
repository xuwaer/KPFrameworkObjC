//
//  NSMutableArray+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (KPExtensions)

/**
 过滤掉nil和NSNull
 */
- (void)kp_addNNilObject:(id)anObject;
- (void)kp_addNNilObjectsFromArray:(NSArray *)otherArray;
// 如果index超过范围,则不添加
- (void)kp_insertNNilObject:(id)anObject atIndex:(NSUInteger)index;
- (void)kp_insertNNilObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
// 移除
- (void)kp_removeNNilObject:(id)anObject;
- (void)kp_removeNNilObject:(id)anObject inRange:(NSRange)range;
- (void)kp_removeNNilObjectsInArray:(NSArray *)otherArray;
- (void)kp_removeLast;
- (void)kp_removeFirst;
// 替换
- (void)kp_replaceAtIndex:(NSUInteger)index withNNilObject:(id)anObject;
- (void)kp_replaceLastWithNNilObject:(id)anObject;
- (void)kp_replaceFirstWithNNilObject:(id)anObject;

/**
 过滤掉nil和NSNull，返回self
 */
- (NSMutableArray *)kp_addObject:(id)anObj;
- (NSMutableArray *)kp_addObjectsFromArray:(NSArray *)otherArray;
- (NSMutableArray *)kp_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (NSMutableArray *)kp_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (NSMutableArray *)kp_removeObject:(id)anObject;
- (NSMutableArray *)kp_removeObject:(id)anObject inRange:(NSRange)range;
- (NSMutableArray *)kp_removeObjectsInArray:(NSArray *)otherArray;

@end
