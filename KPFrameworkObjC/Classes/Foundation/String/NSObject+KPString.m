//
//  NSObject+KPString.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/13.
//

#import "NSObject+KPString.h"

@implementation NSObject (KPString)

- (NSString *)kp_stringValue
{
    if ([self isKindOfClass:NSString.class])
        return (NSString *)self;
    if ([self respondsToSelector:@selector(stringValue)])
        return [self performSelector:@selector(stringValue) withObject:nil];
    return [self description];
}

@end
