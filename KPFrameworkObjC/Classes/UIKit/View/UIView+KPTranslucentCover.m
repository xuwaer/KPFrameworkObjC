//
//  UIView+KPTranslucentCover.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIView+KPTranslucentCover.h"
#import "UIView+KPExtensions.m"

kpViewLayerKey const kpViewLayerKey_TranslucentCover = @"kpViewLayerKey_TranslucentCover";

@implementation UIView (KPTranslucentCover)

- (CATextLayer *)kp_addTranslucentCover:(CGFloat)alpha
{
    return [self kp_addTranslucentCover:alpha text:nil];
}

- (CATextLayer *)kp_addTranslucentCover:(CGFloat)alpha text:(id)text
{
    CATextLayer *coverLayer = (CATextLayer *)[self kp_layerForName:kpViewLayerKey_TranslucentCover];
    if (coverLayer == nil) {
        coverLayer = [CATextLayer layer];
        coverLayer.name = kpViewLayerKey_TranslucentCover;
        [self.layer addSublayer:coverLayer];
    }
    
    coverLayer.frame = self.bounds;
    coverLayer.foregroundColor = [[UIColor whiteColor] CGColor];
    coverLayer.backgroundColor = [[UIColor blackColor] CGColor];
    coverLayer.opacity = alpha;
    coverLayer.string = text;
    
    return coverLayer;
}

- (void)kp_removeTranslucentCover
{
    [self kp_removeLayerForName:kpViewLayerKey_TranslucentCover];
}

@end
