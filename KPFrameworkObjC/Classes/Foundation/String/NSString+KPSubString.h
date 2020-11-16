//
//  NSString+KPSubString.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 子串相关
 */
@interface NSString (KPSubString)

/**
 起止子串判断
 */
-(BOOL)kp_startsWith:(NSString*)subString;
-(BOOL)kp_endsWith:(NSString*)subString;

/**
 子串位置
 */
- (NSUInteger)kp_indexOf:(NSString *)subString;
- (NSUInteger)kp_indexOf:(NSString *)subString fromIndex:(NSUInteger)index;
- (NSUInteger)kp_lastIndexOf:(NSString *)subString;
- (NSUInteger)kp_lastIndexOf:(NSString *)subString fromIndex:(NSUInteger)index;
// 根据regular正则表达式，获取子串的位置
- (NSRange)kp_rangeOfRegular:(NSString *)regular;
- (NSArray<NSString *> *)kp_rangesOf:(NSString *)subString;

/**
 子串获取
 */
- (NSString*)kp_substringAt:(NSInteger)start;
- (NSString*)kp_substringAt:(NSInteger)start length:(NSInteger)length;
- (NSString *)kp_firstWord;
- (NSString *)kp_lastWord;
- (NSString *)kp_lastWordWithLength:(NSUInteger)length;

/**
 添加子串
 */
- (NSString *)kp_append:(NSString *)subString;
- (NSString *)kp_appendPathComponent:(NSString *)pathComponent;
- (NSString *)kp_appendPathExtension:(NSString *)extension;

/**
 子串其他操作
 */
- (NSString *)kp_replace:(NSString *)replace with:(NSString *)with;
- (NSString *)kp_replaceRange:(NSRange)replace with:(NSString *)with;
- (NSString *)kp_remove:(NSString *)subString;
- (BOOL)kp_contain:(NSString *)subString;


/**
 特殊操作
 - (NSString *)kp_stringWithOutNumberSignTag; 去掉#号和#号之间的string
 */
- (NSString *)kp_stringWithOutNumberSignTag;

@end
