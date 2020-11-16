//
//  NSDictionary+KPAttribute.h
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/28.
//

#import <UIKit/UIKit.h>

/**
 因为富文本的使用伴随着多个样式的设定，这里提供一种方法可以连续的设置相关属性
 */
@interface NSDictionary (KPAttribute)

- (NSDictionary *)kp_setTextFont:(UIFont *)font;
- (NSDictionary *)kp_setTextColor:(UIColor *)color;
- (NSDictionary *)kp_setBackgroundColor:(UIColor *)color;
- (NSDictionary *)kp_setStrokeColor:(UIColor *)color;
- (NSDictionary *)kp_setStrokeWidth:(CGFloat)width;
- (NSDictionary *)kp_setStrikethroughStyle:(NSUnderlineStyle)style;
- (NSDictionary *)kp_setStrikethroughColor:(UIColor *)color;
- (NSDictionary *)kp_setUnderlineStyle:(NSUnderlineStyle)style;
- (NSDictionary *)kp_setUnderlineColor:(UIColor *)color;
- (NSDictionary *)kp_setBaselineOffset:(CGFloat)offset;
- (NSDictionary *)kp_setLinkURL:(NSURL *)url;
- (NSDictionary *)kp_setLinkString:(NSString *)url;

/**
 如果设置该值，会替换掉已经设置好的值
 */
- (NSDictionary *)kp_setParagraphStyle:(NSParagraphStyle *)style;

- (NSDictionary *)kp_setLineSpacing:(CGFloat)spacing;
- (NSDictionary *)kp_setParagraphSpacing:(CGFloat)spacing;
- (NSDictionary *)kp_setParagraphSpacingBefore:(CGFloat)spacing;
- (NSDictionary *)kp_setAlignment:(NSTextAlignment)alignment;
- (NSDictionary *)kp_setLineBreakMode:(NSLineBreakMode)alignment;
- (NSDictionary *)kp_setHeadIndent:(CGFloat)headIndent;
- (NSDictionary *)kp_setTailIndent:(CGFloat)tailIndent;
- (NSDictionary *)kp_setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent;
- (NSDictionary *)kp_setMinimumLineHeight:(CGFloat)minimumLineHeight;
- (NSDictionary *)kp_setMaximumLineHeight:(CGFloat)maximumLineHeight;
- (NSDictionary *)kp_setBaseWritingDirection:(NSWritingDirection)direction;

@end
