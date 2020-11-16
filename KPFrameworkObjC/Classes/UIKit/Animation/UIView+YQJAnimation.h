//
//  UIView+YQJAnimaiton.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/10/12.
//

#import <UIKit/UIKit.h>

/**
 临时分类，请勿使用
 */
@interface UIView (YQJAnimation)

@property (nonatomic, assign, readonly) BOOL isRotating;

/**
 开始旋转
 */
- (void)startRotateAnimation;

/**
 停止旋转
 */
- (void)stopRotateAnimation;

@end
