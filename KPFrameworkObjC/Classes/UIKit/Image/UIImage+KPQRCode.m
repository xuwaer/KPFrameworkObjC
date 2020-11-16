//
//  UIImage+KPQRCode.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/22.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIImage+KPQRCode.h"

@implementation UIImage (KPQRCode)

/**
 生成二维码图片
 
 @param content 二维码的内容
 @param size 二维码图片的大小, 默认 480x480
 */
+ (UIImage *)kp_QRImageWithContent:(NSString *)content size:(CGFloat)size
{
    return [self createNonInterpolatedUIImageFormCIImage:[self createQRForString:content] withSize:size];
}

+ (UIImage *)kp_QRImageWithContent:(NSString *)content
{
    return [self kp_QRImageWithContent:content size:480];
}

/**
 *  根据内容生成二维码图片
 */
+ (CIImage *)createQRForString:(NSString *)qrString
{
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    return qrFilter.outputImage;
}

/**
 *  定义图片大小
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end
