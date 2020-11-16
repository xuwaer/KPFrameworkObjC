//
//  KPDotBadge.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/19.
//

#import "KPDotBadge.h"
#import "UIColor+KPColor.h"
#import "UIView+KPExtensions.h"

NSUInteger const KPDotBadgeTag = 0xFF00FF00;

@implementation KPDotBadge

#pragma mark - lifecycle

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}

#pragma mark - public

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view
{
    KPDotBadge *badge = [view viewWithTag:KPDotBadgeTag];
    if (badge == nil) {
        badge = self;
        [view addSubview:badge];
    }
    [badge adjustContent];
    badge.center = point;
    badge.hidden = NO;
}

#pragma mark - private

- (void)initViews
{
    self.borderColor = nil;
    self.borderWidth = 0;
    self.size = CGSizeMake(8, 8);
    self.color = [UIColor redColor01];
    self.tag = KPDotBadgeTag;
}

/**
 *  计算未读标记大小
 */
- (void)adjustContent
{
    self.backgroundColor = self.color;
    [self kp_addBorder:self.borderColor width:self.borderWidth];
    [self kp_addCorners:self.size.width / 2.0 + self.borderWidth];
    self.bounds = CGRectMake(0, 0, self.size.width + self.borderWidth * 2, self.size.height + self.borderWidth * 2);
}

@end
