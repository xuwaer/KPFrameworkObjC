//
//  UIResponder+KPExtensions.h
//  KPExtensionsDemo
//
//  Created by yiqijiao_xukaijun on 2017/9/28.
//  Copyright © 2017年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIResponder (KPExtensions)

/**
 利用相应琏传递信息
 UI复杂且事件数量极多的场景，拿它来处理多事件逻辑是十分合适的
 一般情况下ResponderChain: UIView -> SuperView -> UIController -> Window -> Application
 */
- (void)kp_routeEventWithName:(NSString *)name userinfo:(NSDictionary *)userinfo;

@end
