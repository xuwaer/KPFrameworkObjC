//
//  UITextField+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UITextField+KPExtensions.h"

@implementation UITextField (KPExtensions)

- (UIColor *)kp_placeholderColor
{
    return [self valueForKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setKp_placeholderColor:(UIColor *)color
{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

- (UIFont *)kp_placeholderFont
{
    return [self valueForKeyPath:@"_placeholderLabel.font"];
}

- (void)setKp_placeholderFont:(UIFont *)font
{
    [self setValue:font forKeyPath:@"_placeholderLabel.font"];
}

@end
