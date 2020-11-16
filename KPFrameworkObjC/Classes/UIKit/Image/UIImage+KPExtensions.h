//
//  UIImage+KPExtensions.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KPExtensions)

/**
 gif/jpeg/png
 */
- (NSString *)kp_type;

/**
 模糊.因为该方法会消耗大量的内存来生成图片,不推荐使用
 */
- (UIImage *)kp_blur;

/**
 图片压缩.会有一个极限值,当达到极限值之后就无法再进一步压缩
 1.图片大于1mb,会按照极限值方式压缩.
 2.图片小于200kb则不处理
 */
- (UIImage *)kp_compress;

/**
 图片缩放
 */
- (UIImage *)kp_scaleTo:(CGFloat)scale;
- (UIImage *)kp_scaleToSize:(CGSize)size;
- (UIImage *)kp_scaleByLimitShortSide:(CGFloat)limit;   // 限制图片的短边长度, 在根据scale缩放

/**
 生成color对应的图片
 UIImage默认size(1,1) 默认scale与UIScreen一致
 */
+ (UIImage *)kp_imageWithColor:(UIColor *)color;
+ (UIImage *)kp_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 方向处理.
 图片可能会携带orientation信息(例如拍照的图片),如果直接对图片进行 像素处理 或 drawInRect 等操作,
 会导致orientation信息的清除.因此在做上述操作前必须转换图片方向,以保证处理后的图片显示正常
 */
- (UIImage *)kp_fixOrientation;

@end
