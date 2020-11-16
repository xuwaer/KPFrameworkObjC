//
//  NSDictionary+KPAttribute.m
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/28.
//

#import "NSDictionary+KPAttribute.h"
#import "NSDictionary+KPExtensions.h"

@implementation NSDictionary (KPAttribute)

- (NSDictionary *)kp_setTextFont:(UIFont *)font
{
    return [self kp_setValue:font forKey:NSFontAttributeName];
}

- (NSDictionary *)kp_setTextColor:(UIColor *)color
{
    return [self kp_setValue:color forKey:NSForegroundColorAttributeName];
}

- (NSDictionary *)kp_setBackgroundColor:(UIColor *)color
{
    return [self kp_setValue:color forKey:NSBackgroundColorAttributeName];
}

- (NSDictionary *)kp_setStrokeColor:(UIColor *)color
{
    return [self kp_setValue:color forKey:NSStrokeColorAttributeName];
}

- (NSDictionary *)kp_setStrokeWidth:(CGFloat)width
{
    return [self kp_setValue:@(width) forKey:NSStrokeWidthAttributeName];
}

- (NSDictionary *)kp_setStrikethroughStyle:(NSUnderlineStyle)style
{
    return [self kp_setValue:@(style) forKey:NSStrikethroughStyleAttributeName];
}

- (NSDictionary *)kp_setStrikethroughColor:(UIColor *)color
{
    return [self kp_setValue:color forKey:NSStrikethroughColorAttributeName];
}

- (NSDictionary *)kp_setUnderlineStyle:(NSUnderlineStyle)style
{
    return [self kp_setValue:@(style) forKey:NSUnderlineStyleAttributeName];
}

- (NSDictionary *)kp_setUnderlineColor:(UIColor *)color
{
    return [self kp_setValue:color forKey:NSUnderlineColorAttributeName];
}

- (NSDictionary *)kp_setBaselineOffset:(CGFloat)offset
{
    return [self kp_setValue:@(offset) forKey:NSBaselineOffsetAttributeName];
}

- (NSDictionary *)kp_setLinkURL:(NSURL *)url
{
    return [self kp_setValue:url forKey:NSLinkAttributeName];
}

- (NSDictionary *)kp_setLinkString:(NSString *)url
{
    return [self kp_setValue:url forKey:NSLinkAttributeName];
}

/**
 如果设置该值，会替换掉已经设置好的值
 */
- (NSDictionary *)kp_setParagraphStyle:(NSParagraphStyle *)style
{
    return [self kp_setValue:style forKey:NSParagraphStyleAttributeName];
}

- (NSDictionary *)kp_setLineSpacing:(CGFloat)spacing
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.lineSpacing = spacing;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setParagraphSpacing:(CGFloat)spacing
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.paragraphSpacing = spacing;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setParagraphSpacingBefore:(CGFloat)spacing
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.paragraphSpacingBefore = spacing;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setAlignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.alignment = alignment;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setLineBreakMode:(NSLineBreakMode)mode
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.lineBreakMode = mode;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setHeadIndent:(CGFloat)headIndent
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.headIndent = headIndent;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setTailIndent:(CGFloat)tailIndent
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.tailIndent = tailIndent;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.firstLineHeadIndent = firstLineHeadIndent;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setMinimumLineHeight:(CGFloat)minimumLineHeight
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.minimumLineHeight = minimumLineHeight;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setMaximumLineHeight:(CGFloat)maximumLineHeight
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.maximumLineHeight = maximumLineHeight;
    return [self kp_setParagraphStyle:style];
}

- (NSDictionary *)kp_setBaseWritingDirection:(NSWritingDirection)direction
{
    NSMutableParagraphStyle *style = [self mutableParagraphStyle];
    style.baseWritingDirection = direction;
    return [self kp_setParagraphStyle:style];
}

#pragma mark - private

- (NSMutableParagraphStyle *)mutableParagraphStyle
{
    NSMutableParagraphStyle *style = [[self valueForKey:NSParagraphStyleAttributeName] mutableCopy];
    if (style == nil) style = [NSMutableParagraphStyle new];
    return style;
}

@end
