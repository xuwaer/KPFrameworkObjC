//
//  UIView+KPFrame.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIView+KPFrame.h"

@implementation UIView (KPFrame)

- (CGFloat)kp_x
{
    return self.frame.origin.x;
}

- (void)setKp_x:(CGFloat)kp_x
{
    CGRect frame = self.frame;
    frame.origin.x = kp_x;
    self.frame = frame;
}

- (CGFloat)kp_y
{
    return self.frame.origin.y;
}

- (void)setKp_y:(CGFloat)kp_y
{
    CGRect frame = self.frame;
    frame.origin.y = kp_y;
    self.frame = frame;
}

- (CGFloat)kp_width
{
    return CGRectGetWidth(self.frame);
}

- (void)setKp_width:(CGFloat)kp_width
{
    CGRect frame = self.frame;
    frame.size.width = kp_width;
    self.frame = frame;
}

- (CGFloat)kp_height
{
    return CGRectGetHeight(self.frame);
}

- (void)setKp_height:(CGFloat)kp_height
{
    CGRect frame = self.frame;
    frame.size.height = kp_height;
    self.frame = frame;
}

- (CGSize)kp_size
{
    return self.frame.size;
}

- (void)setKp_size:(CGSize)kp_size
{
    CGRect frame = self.frame;
    frame.size = kp_size;
    self.frame = frame;
}

- (CGPoint)kp_origin
{
    return self.frame.origin;
}

- (void)setKp_origin:(CGPoint)kp_origin
{
    CGRect frame = self.frame;
    frame.origin = kp_origin;
    self.frame = frame;
}

- (CGFloat)kp_midX
{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)kp_midY
{
    return CGRectGetMidY(self.frame);
}

- (CGFloat)kp_maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)kp_maxY
{
    return CGRectGetMaxY(self.frame);
}

@end
