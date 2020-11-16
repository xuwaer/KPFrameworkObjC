//
//  UIImage+KPQRCode.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 二维码相关
 */
@interface UIImage (KPQRCode)

/**
 生成二维码图片
 
 @param content 二维码的内容
 @param size 二维码图片的大小, 默认 480x480
 */
+ (UIImage *)kp_QRImageWithContent:(NSString *)content size:(CGFloat)size;
+ (UIImage *)kp_QRImageWithContent:(NSString *)content;

@end
