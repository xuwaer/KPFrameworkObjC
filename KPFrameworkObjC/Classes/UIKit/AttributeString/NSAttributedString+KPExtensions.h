//
//  NSAttributedString+KPExtensions.h
//  KPFrameworkObjC
//
//  Created by yiqijiao_xukaijun on 2018/4/28.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (KPExtensions)

- (NSAttributedString *)kp_appendAttributedString:(NSAttributedString *)attrString;

- (NSAttributedString *)kp_insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc;

- (NSAttributedString *)kp_replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString;

- (NSAttributedString *)kp_deleteCharactersInRange:(NSRange)range;

@end
