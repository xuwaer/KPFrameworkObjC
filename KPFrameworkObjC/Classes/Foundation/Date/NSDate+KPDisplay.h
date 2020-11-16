//
//  NSDate+KPShown.h
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/21.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 展示的几种样式
 */
@interface NSDate (KPDisplay)

/**
 时间展示规则
 今天：今天HH:mm
 昨天：昨天HH:mm
 前天至当个自然周内：星期x
 更早：M月d日 HH:mm
 去年或更早：yyyy年M月d日
 */
- (NSString *)kp_display01;

@end
