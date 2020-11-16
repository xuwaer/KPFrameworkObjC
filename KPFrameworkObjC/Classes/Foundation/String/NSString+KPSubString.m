//
//  NSString+KPSubString.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/29.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSString+KPSubString.h"

@implementation NSString (KPSubString)

/**
 起止子串判断
 */
-(BOOL)kp_startsWith:(NSString*)subString
{
    return [self kp_indexOf:subString] == 0;
}

-(BOOL)kp_endsWith:(NSString*)subString
{
    NSInteger index = [self kp_lastIndexOf:subString];
    return index > 0 && self.length == index + subString.length;
}

/**
 子串位置
 */
- (NSUInteger)kp_indexOf:(NSString *)subString
{
    NSRange r = [self rangeOfString:subString];
    return r.length <= 0 ? NSNotFound : r.location;
}

- (NSUInteger)kp_indexOf:(NSString *)subString fromIndex:(NSUInteger)index
{
    NSRange r = [self rangeOfString:subString options:NSLiteralSearch range:NSMakeRange(index, self.length - index)];
    return r.length <= 0 ? NSNotFound : r.location;
}

- (NSUInteger)kp_lastIndexOf:(NSString *)subString
{
    return [self kp_lastIndexOf:subString fromIndex:self.length];
}

- (NSUInteger)kp_lastIndexOf:(NSString *)subString fromIndex:(NSUInteger)index
{
    NSRange r = [self rangeOfString:subString options:NSBackwardsSearch range:NSMakeRange(0, index)];
    return r.length == 0 ? NSNotFound : r.location;
}

- (NSRange)kp_rangeOfRegular:(NSString *)regular
{
    return [self rangeOfString:regular options:NSRegularExpressionSearch];
}

- (NSArray<NSString *> *)kp_rangesOf:(NSString *)subString
{
    NSUInteger index = 0;
    NSMutableArray<NSString *> *result = [[NSMutableArray<NSString *> alloc] init];
    while (true) {
        NSRange r = [self rangeOfString:subString options:NSCaseInsensitiveSearch range:NSMakeRange(index, self.length - index)];
        if (r.location == NSNotFound) break;
        // 如果找到了，继续往下寻找
        [result addObject:NSStringFromRange(r)];
        index = r.location + r.length;
    }
    return result;
}

/**
 子串获取
 */
- (NSString*)kp_substringAt:(NSInteger)start
{
    return [self substringWithRange:NSMakeRange(start, self.length - start)];
}

- (NSString*)kp_substringAt:(NSInteger)start length:(NSInteger)length
{
    return [self substringWithRange:NSMakeRange(start, length)];
}

- (NSString *)kp_firstWord
{
    return self.length > 0 ? [self kp_substringAt:0 length:1] : nil;
}

- (NSString *)kp_lastWord
{
    return self.length > 0 ? [self kp_substringAt:self.length - 1 length:1] : nil;
}

- (NSString *)kp_lastWordWithLength:(NSUInteger)length
{
    return self.length <= length ? self : [self substringFromIndex:self.length - length];
}

/**
 添加子串
 */
- (NSString *)kp_append:(NSString *)subString
{
    return [self stringByAppendingString:subString];
}

- (NSString *)kp_appendPathComponent:(NSString *)pathComponent
{
    return [self stringByAppendingPathComponent:pathComponent];
}

- (NSString *)kp_appendPathExtension:(NSString *)extension
{
    return [self stringByAppendingPathExtension:extension];
}

/**
 替换子串
 */
- (NSString *)kp_replace:(NSString *)replace with:(NSString *)with
{
    return [self stringByReplacingOccurrencesOfString:replace withString:with];
}

- (NSString *)kp_replaceRange:(NSRange)replace with:(NSString *)with
{
    return [self stringByReplacingCharactersInRange:replace withString:with];
}

/**
 去掉子串
 */
- (NSString *)kp_remove:(NSString *)subString
{
    return [self stringByReplacingOccurrencesOfString:subString withString:@""];
}

/**
 是否包含子串
 */
- (BOOL)kp_contain:(NSString *)subString
{
    return [self kp_indexOf:subString] != NSNotFound;
}


/**
 特殊操作
 - (NSString *)kp_stringWithOutNumberSignTag; 去掉#号和#号之间的string
 */
- (NSString *)kp_stringWithOutNumberSignTag
{
    NSRange range = [self kp_rangeOfRegular:@"#([\\s\\S]*)#"];
    return range.location != NSNotFound ? [self kp_replaceRange:range with:@""] : self;
}

@end
