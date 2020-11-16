//
//  NSNumber+KPExtensions.m
//  KPExtensionUtil
//
//  Created by yiqijiao_xukaijun on 2017/8/31.
//  Copyright © 2017年 yiqijiao. All rights reserved.
//

#import "NSNumber+KPExtensions.h"

@implementation NSNumber (KPExtensions)

// ++
- (NSNumber *)kp_increment
{
    return @(self.doubleValue + 1);
}

// --
- (NSNumber *)kp_decrement
{
    return @(self.doubleValue - 1);
}

/**
 根据时间戳转换为NSDate.
 */
- (NSDate *)kp_dateFromTimeStamp10
{
    return [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
}

- (NSDate *)kp_dateFromTimeStamp13
{
    return [NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000.0];
}
    
- (NSString *)kp_secondDurationWithoutHour
{
    int totalSeconds = self.intValue;
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}
    
- (NSString *)kp_secondDuration
{
    int totalSeconds = self.intValue;
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}

@end
