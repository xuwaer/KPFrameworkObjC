//
//  UIView+KPGesture.h
//  YQJToolKit
//
//  Created by yiqijiao_xukaijun on 2017/11/30.
//

#import <UIKit/UIKit.h>

@interface UIView (KPGesture)

@property (nonatomic, copy) void(^kp_onTap)(UIView *view);

@end
