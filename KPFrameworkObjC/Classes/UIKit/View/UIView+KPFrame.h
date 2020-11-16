//
//  UIView+KPFrame.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/4.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 frame操作
 */
@interface UIView (KPFrame)

@property (nonatomic, assign) CGFloat kp_x;
@property (nonatomic, assign) CGFloat kp_y;
@property (nonatomic, assign) CGFloat kp_width;
@property (nonatomic, assign) CGFloat kp_height;
@property (nonatomic, assign) CGPoint kp_origin;
@property (nonatomic, assign) CGSize kp_size;

@property (nonatomic, assign, readonly) CGFloat kp_midX;
@property (nonatomic, assign, readonly) CGFloat kp_midY;
@property (nonatomic, assign, readonly) CGFloat kp_maxX;
@property (nonatomic, assign, readonly) CGFloat kp_maxY;

@end
