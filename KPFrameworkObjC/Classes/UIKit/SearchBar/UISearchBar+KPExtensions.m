//
//  UISearchBar+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UISearchBar+KPExtensions.h"

@implementation UISearchBar (KPExtensions)

- (UITextField *)textField
{
    return [self valueForKey:@"_searchField"];
}

- (void)kp_setTransparent
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UIView")] && view.subviews.count > 0) {
            view.backgroundColor = [UIColor clearColor];
            [[view.subviews objectAtIndex:0] removeFromSuperview];
            break;
        }
    }
}


@end
