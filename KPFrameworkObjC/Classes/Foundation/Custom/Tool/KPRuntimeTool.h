//
//  KPRuntimeTool.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/10/18.
//

#import <Foundation/Foundation.h>

@interface KPRuntimeTool : NSObject

/**
 把selector转换成NSInvocation。推荐使用NSDictionary保存下来，通过key来指定调用。
 
 invocation的使用
 [invocation setArgument:&userinfo atIndex:2];
 [invocation invoke];
 */
+ (NSInvocation *)invocationForSelector:(SEL)selector target:(id)target;

@end
