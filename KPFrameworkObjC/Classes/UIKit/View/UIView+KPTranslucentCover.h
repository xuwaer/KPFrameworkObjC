//
//  UIView+KPTranslucentCover.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "KPViewConst.h"

UIKIT_EXTERN kpViewLayerKey const kpViewLayerKey_TranslucentCover;

/**
 半透明遮罩层+白色文字
 */
@interface UIView (KPTranslucentCover)

- (CATextLayer *)kp_addTranslucentCover:(CGFloat)alpha;
- (CATextLayer *)kp_addTranslucentCover:(CGFloat)alpha text:(id)text;       // NSString or NSAttributeString
- (void)kp_removeTranslucentCover;

@end
