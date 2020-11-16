//
//  UIView+KPBadge.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/19.
//

#import "KPDotBadge.h"
#import "KPTextBadge.h"

@interface UIView (KPBadge)

// 这里会放置到指定的view中
// 且不能覆盖badge的tag 0xFF00FF00 和 0xFF00FF01

// 红点提示
- (void)kp_showDotBadgeAtPoint:(CGPoint)point;
- (void)kp_showDotBadge:(KPDotBadge *)badge atPoint:(CGPoint)point;
- (void)kp_hideDotBadge;

// 文字提示
- (void)kp_showTextBadgeAtPoint:(CGPoint)point text:(NSString *)text;
- (void)kp_showTextBadge:(KPTextBadge *)badge atPoint:(CGPoint)point text:(NSString *)text;
- (void)kp_hideTextBadge;

// 预制样式
// 红点
- (void)kp_showNormalDotBadgeAtPoint:(CGPoint)point;
// 带白色边框的红点
- (void)kp_showBorderDotBadgeAtPoint:(CGPoint)point;

// 红底白字
- (void)kp_showNormalTextBadgeAtPoint:(CGPoint)point text:(NSString *)text;
// 带白色边框的红底白字
- (void)kp_showBorderTextBadgeAtPoint:(CGPoint)point text:(NSString *)text;


@end
