//
//  NSDate+KPShown.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/9/21.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSDate+KPDisplay.h"
#import "NSDate+KPExtensions.h"

@implementation NSDate (KPDisplay)

- (NSString *)kp_display01
{
    NSDate *now = [NSDate kp_now];
    
    // 去年或更早：yyyy年M月d日
    if ([now kp_year] != [self kp_year]) {
        return [self kp_dateFormat:@"yyyy年M月d日"];
    }
    
    // 由于系统周日为1周开始，需要转换为显示用的日期
    NSInteger nowWeek = [now kp_weekday] == 1 ? [now kp_weekOfYear] + 1 : [now kp_weekOfYear];
    NSInteger showWeek = [self kp_weekday] == 1 ? [self kp_weekOfYear] + 1 : [self kp_weekOfYear];
    // 更早：M月d日 HH:mm
    if (labs(nowWeek - showWeek) > 0) {
        return [self kp_dateFormat:@"M月d日 HH:mm"];
    }
    
    // 前天至当个自然周内：周W HH:mm
    NSInteger nowDay = [now kp_day];
    NSInteger showDay = [self kp_day];
    if (labs(nowDay - showDay) > 1) {
        return [self kp_dateFormat:@"EEE"];
    }
    
    // 昨天：昨天HH:mm
    if (labs(nowDay - showDay) > 0) {
        return [self kp_dateFormat:@"昨天 HH:mm"];
    }
    // 今天：今天HH:mm
    return [self kp_dateFormat:@"今天 HH:mm"];
}

@end
