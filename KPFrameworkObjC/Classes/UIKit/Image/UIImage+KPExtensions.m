//
//  UIImage+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/1.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "UIImage+KPExtensions.h"

@implementation UIImage (KPExtensions)

+ (CGFloat)screenScale
{
    return [[UIScreen mainScreen] scale];
}

/**
 gif/jpeg/png
 */
- (NSString *)kp_type
{
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
    }
    return nil;
}

/**
 模糊.因为该方法会消耗大量的内存来生成图片,不推荐使用
 */
- (UIImage *)kp_blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:15.0f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage scale:[self.class screenScale] orientation:UIImageOrientationUp];
    CGImageRelease(cgImage);
    return returnImage;
}

/**
 图片压缩.会有一个极限值,当达到极限值之后就无法再进一步压缩
 */
- (UIImage *)kp_compress
{
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    if (data.length>1024*1024) {        // >1mb
        data=UIImageJPEGRepresentation(self, 0.1);
    }
    else if (data.length>512*1024) {    // 512kb~1mb
        data=UIImageJPEGRepresentation(self, 0.3);
    }
    else if (data.length>200*1024) {    // > 200kb
        data=UIImageJPEGRepresentation(self, 0.7);
    }
    else {  // < 200kb
        return self;
    }
    return [[UIImage alloc] initWithData:data];
}

/**
 图片缩放
 */
- (UIImage *)kp_scaleTo:(CGFloat)scale
{
    return [self kp_scaleToSize:CGSizeMake(self.size.width * scale, self.size.height * scale)];
}

- (UIImage *)kp_scaleToSize:(CGSize)size
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformRotate(transform, 0);
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    CGContextConcatCTM(UIGraphicsGetCurrentContext(), transform);
    UIImage* compressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImage;
}

- (UIImage *)kp_scaleByLimitShortSide:(CGFloat)limit   // 限制图片的短边长度, 在根据scale缩放
{
    if (limit <= 0)
        return self;
    if (self.size.width <= limit && self.size.height <= limit)
        return self;
    if (self.size.width > self.size.height && self.size.height > limit)
        return [self kp_scaleToSize:CGSizeMake(limit / self.size.height * self.size.width, limit)];
    if (self.size.height > self.size.width && self.size.width > limit)
        return [self kp_scaleToSize:CGSizeMake(limit, limit / self.size.width * self.size.height)];
    return self;
}

/**
 生成color对应的图片size 1, 1
 */
+ (UIImage *)kp_imageWithColor:(UIColor *)color
{
    return [self kp_imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

+ (UIImage *)kp_imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 方向处理.
 图片可能会携带orientation信息(例如拍照的图片),如果直接对图片进行 像素处理 或 drawInRect 等操作,
 会导致orientation信息的清除.因此在做上述操作前必须转换图片方向,以保证处理后的图片显示正常
 */
- (UIImage *)kp_fixOrientation
{
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg scale:[self.class screenScale] orientation:UIImageOrientationUp];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
