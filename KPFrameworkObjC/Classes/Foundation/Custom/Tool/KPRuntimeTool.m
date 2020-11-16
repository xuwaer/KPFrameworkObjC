//
//  KPRuntimeTool.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/10/18.
//

#import "KPRuntimeTool.h"

@implementation KPRuntimeTool

+ (NSInvocation *)invocationForSelector:(SEL)selector target:(id)target
{
    NSMethodSignature *methodSignature = [target methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.target = target;
    invocation.selector = selector;
    return invocation;
}

@end
