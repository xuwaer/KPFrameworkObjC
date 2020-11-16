//
//  UIView+KPBadge.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/19.
//

#import "UIView+KPBadge.h"

@implementation UIView (KPBadge)

// 这里会放置到指定的view的superView中，请确保view.superView不为空，且没被覆盖
// 且不能覆盖badge的tag 0xFF00FF00

// 红点提示
- (void)kp_showDotBadgeAtPoint:(CGPoint)point
{
    [self kp_showDotBadge:nil atPoint:point];
}

- (void)kp_showDotBadge:(KPDotBadge *)badge atPoint:(CGPoint)point
{
    if (badge == nil) badge = [KPDotBadge new];
    [badge showAtPoint:point inView:self];
}

- (void)kp_hideDotBadge
{
    KPDotBadge *dot = [self viewWithTag:KPDotBadgeTag];
    if (dot != nil) dot.hidden = YES;
}
// 文字提示
- (void)kp_showTextBadgeAtPoint:(CGPoint)point text:(NSString *)text
{
    [self kp_showTextBadge:nil atPoint:point text:text];
}

- (void)kp_showTextBadge:(KPTextBadge *)badge atPoint:(CGPoint)point text:(NSString *)text
{
    if (badge == nil) badge = [KPTextBadge new];
    badge.text = text;
    [badge showAtPoint:point inView:self];
}

- (void)kp_hideTextBadge
{
    KPTextBadge *text = [self viewWithTag:KPTextBadgeTag];
    if (text != nil) text.hidden = YES;
}



// 预制样式红点
- (void)kp_showNormalDotBadgeAtPoint:(CGPoint)point
{
    [self kp_showDotBadge:nil atPoint:point];
}

- (void)kp_showBorderDotBadgeAtPoint:(CGPoint)point
{
    KPDotBadge *badge = [KPDotBadge new];
    badge.borderColor = [UIColor whiteColor];
    badge.borderWidth = 1;
    [self kp_showDotBadge:badge atPoint:point];
}

- (void)kp_showNormalTextBadgeAtPoint:(CGPoint)point text:(NSString *)text
{
    [self kp_showTextBadgeAtPoint:point text:text];
}

- (void)kp_showBorderTextBadgeAtPoint:(CGPoint)point text:(NSString *)text
{
    KPTextBadge *badge = [KPTextBadge new];
    badge.borderColor = [UIColor whiteColor];
    badge.borderWidth = 1;
    [self kp_showTextBadge:badge atPoint:point text:text];
}

@end
