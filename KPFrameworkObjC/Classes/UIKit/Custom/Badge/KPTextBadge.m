//
//  KPTextBadge.m
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/12/19.
//

#import "KPTextBadge.h"
#import "UIColor+KPColor.h"
#import "UIView+KPExtensions.h"
#import "UIView+KPFrame.h"

NSUInteger const KPTextBadgeTag = 0xFF00FF01;

@implementation KPTextBadge

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
    KPTextBadge *badge = [view viewWithTag:KPTextBadgeTag];
    if (badge == nil) {
        badge = self;
        [view addSubview:badge];
    }
    badge.text = self.text;
    [badge adjustContent];
    badge.center = point;
    badge.hidden = NO;
}

#pragma mark - private

- (void)initViews
{
    self.borderColor = nil;
    self.borderWidth = 0;
    self.minSize = CGSizeZero;
    self.color = [UIColor redColor01];
    self.font = [UIFont systemFontOfSize:12];
    self.textColor = [UIColor whiteColor];
    self.horizontalTextPadding = 4;
    self.verticalTextPadding = 2;
    self.numberOfLines = 1;
    self.textAlignment = NSTextAlignmentCenter;
    self.tag = KPTextBadgeTag;
}

/**
 *  计算未读标记大小
 */
- (void)adjustContent
{
    self.backgroundColor = self.color;
    [self kp_addBorder:self.borderColor width:self.borderWidth];
    
    [self sizeToFit];
    CGSize adjustSize = CGSizeMake(MAX(self.minSize.width, self.kp_width + 2 * self.horizontalTextPadding),
                                   MAX(self.minSize.height, self.kp_height + 2 * self.verticalTextPadding));
    // 保证最小为圆形
    adjustSize = CGSizeMake(MAX(adjustSize.width, adjustSize.height), adjustSize.height);
    [self kp_addCorners:adjustSize.height / 2.0 + self.borderWidth];
    self.bounds = CGRectMake(0, 0, adjustSize.width + self.borderWidth, adjustSize.height + self.borderWidth);
}

@end
