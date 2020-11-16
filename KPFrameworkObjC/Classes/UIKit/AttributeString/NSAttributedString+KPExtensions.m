//
//  NSAttributedString+KPExtensions.m
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/28.
//

#import "NSAttributedString+KPExtensions.h"

@implementation NSAttributedString (KPExtensions)

- (instancetype)kp_appendAttributedString:(NSAttributedString *)attrString
{
    NSMutableAttributedString *attributeString = [self mutableCopy];
    [attributeString appendAttributedString:attrString];
    return attributeString;
}

- (NSAttributedString *)kp_insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc
{
    NSMutableAttributedString *attributeString = [self mutableCopy];
    [attributeString insertAttributedString:attrString atIndex:loc];
    return attributeString;
}

- (NSAttributedString *)kp_replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString
{
    NSMutableAttributedString *attributeString = [self mutableCopy];
    [attributeString replaceCharactersInRange:range withString:attrString];
    return attributeString;
}

- (NSAttributedString *)kp_deleteCharactersInRange:(NSRange)range
{
    NSMutableAttributedString *attributeString = [self mutableCopy];
    [attributeString deleteCharactersInRange:range];
    return attributeString;
}

@end
