//
//  UIResponder+KPExtensions.m
//  KPExtensionsDemo
//
//  Created by yiqijiao_xukaijun on 2017/9/28.
//  Copyright © 2017年 xukj. All rights reserved.
//

#import "UIResponder+KPExtensions.h"

@implementation UIResponder (KPExtensions)

- (void)kp_routeEventWithName:(NSString *)name userinfo:(NSDictionary *)userinfo
{
    [[self nextResponder] kp_routeEventWithName:name userinfo:userinfo];
}

@end
